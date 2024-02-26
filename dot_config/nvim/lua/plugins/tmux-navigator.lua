return {
  "alexghergh/nvim-tmux-navigation",
  keys = {
    {
      "<C-h>",
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
      end,
      desc = "NeoTree",
    },
    {
      "<C-j>",
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateDown()
      end,
      desc = "NeoTree",
    },
    {
      "<C-k>",
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateUp()
      end,
      desc = "NeoTree",
    },
    {
      "<C-l>",
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateRight()
      end,
      desc = "NeoTree",
    },
  },
  opts = {
    disable_when_zoomed = true,
  },
}
