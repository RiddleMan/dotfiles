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

  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",

      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  },

  "christoomey/vim-tmux-navigator",

  "tpope/vim-fugitive",
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

  { "numToStr/Comment.nvim" },

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

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  { "folke/neodev.nvim", opts = {} },

  { "onsails/lspkind.nvim" },
}
