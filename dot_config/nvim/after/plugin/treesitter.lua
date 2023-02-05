require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "cmake",
    "comment",
    "css",
    "diff",
    "dockerfile",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "graphql",
    "help",
    "html",
    "http",
    "ini",
    "javascript",
    "jq",
    "json",
    "json5",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "regex",
    "rust",
    "sql",
    "terraform",
    "toml",
    "typescript",
    "vim",
    "yaml"
  },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
