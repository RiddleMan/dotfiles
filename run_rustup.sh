#!/usr/bin/env zsh

set -e

rustup update
rustup component add clippy rustfmt

ln -sf ~/.cargo/bin/cargo-binstall-raw/cargo-binstall ~/.cargo/bin/cargo-binstall
