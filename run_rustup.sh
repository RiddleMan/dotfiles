#!/usr/bin/env zsh

set -e

rustup update
rustup target add aarch64-apple-ios x86_64-apple-ios aarch64-apple-ios-sim
rustup component add clippy rustfmt

ln -sf ~/.cargo/bin/cargo-binstall-raw/cargo-binstall ~/.cargo/bin/cargo-binstall
