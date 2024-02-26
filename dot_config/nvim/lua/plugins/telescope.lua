return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },

    config = function()
      local telescope = require("telescope")

      telescope.setup({})
      telescope.load_extension("fzf")

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
      vim.keymap.set("n", "<leader>paf", function()
        builtin.find_files({
          hidden = true,
        })
      end, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fag", function()
        builtin.live_grep({
          additional_args = function()
            return { "--hidden" }
          end,
        })
      end, {})
    end,
  },
}
