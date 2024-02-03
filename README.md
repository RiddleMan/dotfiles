# Dotfiles

## Installation

Create an optional config file in `~/.config/chezmoi/chezmoi.toml

```toml
encryption = "gpg"
[gpg]
  recipient = "0xPUBLI_CKEY_ID"

[data]
  hosttype = "private" # private | work
  email = "user@email.com"

[merge]
  command = "nvim"
  args = ["-d", "{{ .Destination }}", "{{ .Source }}", "{{ .Target }}"]
```

Install chezmoi first by doing:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply RiddleMan
```

## Documentation

* [Neovim](./docs/neovim.md)
* [Music](./docs/music.md)

