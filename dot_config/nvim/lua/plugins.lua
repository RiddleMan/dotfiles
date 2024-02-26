return {
  {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    as = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  },

  "christoomey/vim-tmux-navigator",

  "tpope/vim-unimpaired",

  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      default = true,
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  { "numToStr/Comment.nvim", opts = {} },

  { "tpope/vim-speeddating" },

  {
    "kylechui/nvim-surround",
    version = "*",
    opts = {},
    event = "VeryLazy",
  },

  { "kevinhwang91/nvim-bqf", ft = "qf" },

  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
}
