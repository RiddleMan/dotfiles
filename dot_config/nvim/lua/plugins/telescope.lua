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

    init = function()
      vim.keymap.set("n", "<leader>pf", function()
        require("telescope.builtin").find_files()
      end, {})
      vim.keymap.set("n", "<leader>paf", function()
        require("telescope.builtin").find_files({
          hidden = true,
        })
      end, {})
      vim.keymap.set("n", "<leader>fg", function()
        require("telescope.builtin").live_grep()
      end, {})
      vim.keymap.set("n", "<leader>fag", function()
        require("telescope.builtin").live_grep({
          additional_args = function()
            return { "--hidden" }
          end,
        })
      end, {})
    end,

    config = function()
      local telescope = require("telescope")
      telescope.setup({})
      telescope.load_extension("fzf")
    end,
  },
}
