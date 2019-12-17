#!/bin/sh

set -e

scriptName=$(basename "$0")
lastSyncPath="/tmp/$scriptName.last_sync"
resultsPath="/tmp/$scriptName.results"

get_repositories_info() {
	curl -s -u "$BITBUCKET_USER:$BITBUCKET_PASSWORD" \
		"https://api.bitbucket.org/2.0/user/permissions/repositories?page=$1" \
		| tr '\r\n' '  '
}
next_page() {
	echo "$1" | jq '.next'
}

results=""
currTime=$(date +%s)
lastSync=$(cat -q "$lastSyncPath" 2>/dev/null || echo "$currTime")

if [ "$lastSync" -gt $((currTime - 30 * 24 * 60 * 60)) ]; then
	echo "Loading from cache"
	results=$(cat "$resultsPath")
else
	echo "Refreshing a results..."
	currentResponse=""
	page=1

	while true; do
		echo "Downloading page $page..."
		currentResponse=$(get_repositories_info $page)
		if [ "$(next_page "$currentResponse")" = "null" ]; then
			break
		fi

		links=$(echo "$currentResponse" | jq '.values[].repository.links.html.href' | tr -d '\"')
		results="$results$links"
		page=$((page + 1))
	done
	echo "$results" > "$resultsPath"
	echo "$currTime" > "$lastSyncPath"
	echo "Finished downloading"
fi

pageAddress=$(echo "$results" | fzf)
open "$pageAddress"
