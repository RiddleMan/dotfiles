return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {},
    init = function()
      vim.keymap.set("n", "H", vim.cmd.bprev, {})
      vim.keymap.set("n", "L", vim.cmd.bnext, {})
    end,
  },
}
