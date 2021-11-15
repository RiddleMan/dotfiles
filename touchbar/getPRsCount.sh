#!/bin/sh

reposList="$(curl -X GET \
  -u "$BITBUCKET_USER:$BITBUCKET_PASSWORD" \
  'https://api.bitbucket.org/2.0/repositories?role=member&fields=values.full_name&pagelen=100' | jq '.values[].full_name')"

echo "$reposList"
