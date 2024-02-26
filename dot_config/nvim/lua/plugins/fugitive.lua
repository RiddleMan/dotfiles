return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    init = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git, {})
    end,
  },
}
