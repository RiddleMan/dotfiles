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
