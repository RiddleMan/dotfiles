require("nvim-tree").setup({
  disable_netrw = true,

  filesystem_watchers = {
    ignore_dirs = { "node_modules" },
  },
})
local api = require("nvim-tree.api")

local function open_nvim_tree(data)
  local is_real_file = vim.fn.filereadable(data.file) == 1
  local is_no_name = data.file == "" and vim.bo[data.buf].buftype == ""
  local is_gitcommit = vim.bo[data.buf].filetype == "gitcommit"
  local is_directory = vim.fn.isdirectory(data.file) == 1

  if
    (not is_real_file and not is_no_name and not is_directory) or is_gitcommit
  then
    return
  end

  if is_directory then
    vim.cmd.cd(data.file)
    api.tree.open()
  else
    api.tree.toggle({ focus = false, find_file = true })
  end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = open_nvim_tree,
})

local function open_current_file_in_tree()
  local curr_buff = vim.api.nvim_buf_get_name(0)

  api.tree.focus()
  api.tree.find_file(curr_buff)
end

vim.keymap.set("n", "<leader>tc", open_current_file_in_tree, {})

vim.keymap.set("n", "<c-\\>", api.tree.toggle, {})
