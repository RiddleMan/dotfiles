require"nvim-tree".setup()
local api = require"nvim-tree.api"

local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  vim.cmd.cd(data.file)
  api.tree.open()
end

vim.api.nvim_create_autocmd(
  { "VimEnter" },
  {
    callback = open_nvim_tree
  }
)

vim.keymap.set(
  'n',
  '<leader>tc',
  function()
    local curr_buff = vim.api.nvim_buf_get_name(0)

    api.tree.find_file(curr_buff)
  end,
  {}
)
