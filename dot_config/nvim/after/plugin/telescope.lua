local telescope = require("telescope")

telescope.setup({
  pickers = {
    live_grep = {
      additional_args = function()
        return { "--hidden" }
      end,
    },
    git_files = {
      hidden = true,
    },
    find_files = {
      hidden = true,
    },
  },
})
telescope.load_extension("fzf")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.git_files, {})
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
