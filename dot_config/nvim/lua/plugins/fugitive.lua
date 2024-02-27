return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    init = function()
      require("which-key").register({
        ["<leader>gs"] = {
          vim.cmd.Git,
          "Git status",
        },
      })
    end,
  },
}
