return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-ui-select.nvim",
      {
        "junegunn/fzf",
        build = function()
          vim.fn["fzf#install"]()
        end,
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },

    init = function()
      require("which-key").add({
        {
          "<leader>p",
          group = "project",
        },
        {
          "<leader>pf",
          function()
            require("telescope.builtin").find_files()
          end,
          desc = "Find Files",
        },
        {
          "<leader>pa",
          group = "all",
        },
        {
          "<leader>paf",
          function()
            require("telescope.builtin").find_files({ hidden = true })
          end,
          desc = "Find Files",
        },
        {
          "<leader>f",
          group = "files",
        },
        {
          "<leader>fg",
          function()
            require("telescope.builtin").live_grep()
          end,
          desc = "Grep",
        },
        {
          "<leader>fa",
          group = "all",
        },
        {
          "<leader>fag",
          function()
            require("telescope.builtin").live_grep({
              additional_args = function()
                return { "--hidden" }
              end,
            })
          end,
          desc = "Grep",
        },
        {
          "q:",
          function()
            require("telescope.builtin").command_history()
          end,
          desc = "Command History",
        },
        { "<leader>h", group = "+help" },
        {
          "<leader>hh",
          function()
            require("telescope.builtin").help_tags()
          end,
          desc = "Help Tags",
        },
        { "<leader>g", group = "git" },
        {
          "<leader>gs",
          function()
            require("telescope.builtin").git_status()
          end,
          desc = "Status",
        },
        {
          "<leader>gb",
          function()
            require("telescope.builtin").git_branches()
          end,
          desc = "Branches",
        },
        {
          "<leader>gc",
          function()
            require("telescope.builtin").git_commits()
          end,
          desc = "Commits",
        },
      })
    end,

    config = function()
      local telescope = require("telescope")
      telescope.setup({})
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
    end,
  },
}
