#!/usr/bin/env osascript -l JavaScript

function run() {
  var app = Application('Spotify');

  app.shuffling = !app.shufflingEnabled();
}
