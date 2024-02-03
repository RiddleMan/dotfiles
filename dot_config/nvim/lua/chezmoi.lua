vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.fn.expand("~/.local/share/chezmoi") .. "/*",
  command = "silent ! chezmoi apply --source-path '%'",
})
