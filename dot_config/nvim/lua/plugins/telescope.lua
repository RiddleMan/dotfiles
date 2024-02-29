return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "junegunn/fzf",
        build = function()
          vim.fn["fzf#install"]()
        end,
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },

    init = function()
      require("which-key").register({
        ["<leader>p"] = {
          name = "+project",
          f = {
            function()
              require("telescope.builtin").find_files()
            end,
            "Find Files",
          },
          a = {
            name = "+all",
            f = {

              function()
                require("telescope.builtin").find_files({ hidden = true })
              end,
              "Find Files",
            },
          },
        },
        ["<leader>f"] = {
          name = "+files",
          g = {
            function()
              require("telescope.builtin").live_grep()
            end,
            "Grep",
          },
          a = {
            name = "+all",
            g = {
              function()
                require("telescope.builtin").live_grep({
                  additional_args = function()
                    return { "--hidden" }
                  end,
                })
              end,
              "Grep",
            },
          },
        },
        ["q:"] = {
          function()
            require("telescope.builtin").command_history()
          end,
          "Command History",
        },
        ["<leader>h"] = {
          name = "+help",
          h = {
            function()
              require("telescope.builtin").help_tags()
            end,
            "Help Tags",
          },
        },
        ["<leader>g"] = {
          name = "+git",
          s = {
            function()
              require("telescope.builtin").git_status()
            end,
            "Status",
          },
          b = {
            function()
              require("telescope.builtin").git_branches()
            end,
            "Branches",
          },
          c = {
            function()
              require("telescope.builtin").git_commits()
            end,
            "Commits",
          },
        },
      })
    end,

    config = function()
      local telescope = require("telescope")
      telescope.setup({})
      telescope.load_extension("fzf")
    end,
  },
}
