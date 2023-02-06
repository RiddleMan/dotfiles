require"nvim-tree".setup()

local api = require("nvim-tree.api")
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    api.tree.open()
  end
})

