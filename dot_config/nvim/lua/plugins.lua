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

  { "tpope/vim-unimpaired", event = "VeryLazy" },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {
      default = true,
    },
  },

  {
    "nvim-lualine/lualine.nvim",

    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        disabled_filetypes = {
          "statusline",
          "winbar",
          "NvimTree",
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  { "numToStr/Comment.nvim", event = "VeryLazy", opts = {} },

  { "tpope/vim-speeddating", event = "VeryLazy" },

  {
    "kylechui/nvim-surround",
    version = "*",
    opts = {},
    event = "VeryLazy",
  },

  { "kevinhwang91/nvim-bqf", ft = "qf" },

  {
    "folke/which-key.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {},
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
  },

  { "williamboman/mason.nvim", lazy = false, config = true },
}
