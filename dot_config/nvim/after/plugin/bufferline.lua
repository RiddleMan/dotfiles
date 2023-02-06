require("bufferline").setup{}

vim.keymap.set('n', 'H', vim.cmd.bprev, {})
vim.keymap.set('n', 'L', vim.cmd.bnext, {})
