require("lazy").setup({
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
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

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  "christoomey/vim-tmux-navigator",

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "rose-pine/neovim",
    as = "rose-pine",
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    tag = "nightly",
  },

  "tpope/vim-fugitive",
  "tpope/vim-unimpaired",

  {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  { "jose-elias-alvarez/null-ls.nvim" },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
  },

  { "numToStr/Comment.nvim" },

  { "tpope/vim-speeddating" },

  {
    "kylechui/nvim-surround",
    tag = "*",
  },

  { "kevinhwang91/nvim-bqf", ft = "qf" },

  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "marilari88/neotest-vitest",
      "haydenmeade/neotest-jest",
      "rouge8/neotest-rust",
    },
  },

  { "github/copilot.vim" },
})
