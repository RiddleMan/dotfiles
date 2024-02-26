return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    init = function()
      vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = { "*.Tiltfile", "Tiltfile" },
        callback = function()
          local buf = vim.api.nvim_get_current_buf()
          vim.api.nvim_buf_set_option(buf, "filetype", "starlark")
        end,
      })
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
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
          "vimdoc",
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
          "starlark",
          "terraform",
          "toml",
          "typescript",
          "vim",
          "yaml",
        },

        sync_install = false,

        auto_install = true,

        highlight = {
          enable = true,

          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
}
