#!/usr/bin/env osascript -l JavaScript

function run() {
  var app = Application('Spotify');
  console.log(app.currentTrack().spotifyUrl())
}
