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

local function open_current_file_in_tree()
  local curr_buff = vim.api.nvim_buf_get_name(0)

  api.tree.focus()
  api.tree.find_file(curr_buff)
end

vim.keymap.set(
  'n',
  '<leader>tc',
  open_current_file_in_tree,
  {}
)

vim.keymap.set(
  'n',
  '<c-\\>',
  api.tree.toggle,
  {}
)
