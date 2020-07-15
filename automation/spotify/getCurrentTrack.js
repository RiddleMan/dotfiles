#!/usr/bin/env osascript -l JavaScript

function run() {
  var app = Application('Spotify');
  var url = app.currentTrack().spotifyUrl();
  console.log('https://open.spotify.com/track/' + url.replace('spotify:track:', ''))
}
