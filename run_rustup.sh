#!/usr/bin/env zsh

set -e

rustup update
rustup component add clippy rustfmt
