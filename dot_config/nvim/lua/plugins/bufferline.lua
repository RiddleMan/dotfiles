return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {},
    init = function()
      require("which-key").register({
        H = { vim.cmd.bprev, "Previous buffer" },
        L = { vim.cmd.bnext, "Next buffer" },
      })
    end,
  },
}
