return {
  {
    "alexghergh/nvim-tmux-navigation",
    keys = {
      {
        "<C-h>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
        end,
        desc = "Tmux Navigate Left",
      },
      {
        "<C-j>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateDown()
        end,
        desc = "Tmux Navigate Down",
      },
      {
        "<C-k>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateUp()
        end,
        desc = "Tmux Navigate Up",
      },
      {
        "<C-l>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateRight()
        end,
        desc = "Tmux Navigate Right",
      },
    },
    opts = {
      disable_when_zoomed = true,
    },
  },
}
