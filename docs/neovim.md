# Neovim

## Search and replace

1. [Search across multiple lines](https://vim.fandom.com/wiki/Search_across_multiple_lines)

## Spellcheck

* `]s`: next error

* `[s`: previous error

* `z=`: fix error

* `1z=`: fix error by choosing first option

* `zg`: add to dictionary

* `zw`: mark as bad word

See more: `:help spell`

## LSP

* `K`: Displays hover information about the symbol under the cursor in a floating window. See [:help vim.lsp.buf.hover()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.hover()).

* `gd`: Jumps to the definition of the symbol under the cursor. See [:help vim.lsp.buf.definition()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.definition()).

* `gD`: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See [:help vim.lsp.buf.declaration()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.declaration()).

* `gi`: Lists all the implementations for the symbol under the cursor in the quickfix window. See [:help vim.lsp.buf.implementation()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.implementation()).

* `go`: Jumps to the definition of the type of the symbol under the cursor. See [:help vim.lsp.buf.type_definition()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.type_definition()).

* `gr`: Lists all the references to the symbol under the cursor in the quickfix window. See [:help vim.lsp.buf.references()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.references()).

* `<leader>K`: Displays signature information about the symbol under the cursor in a floating window. See [:help vim.lsp.buf.signature_help()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.signature_help()). If a mapping already exists for this key this function is not bound.

* `<F2>/<leader>r`: Renames all references to the symbol under the cursor. See [:help vim.lsp.buf.rename()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.rename()).

* `<F4>`: Selects a code action available at the current cursor position. See [:help vim.lsp.buf.code_action()](https://neovim.io/doc/user/lsp.html#vim.lsp.buf.code_action()).

* `gl`: Show diagnostics in a floating window. See [:help vim.diagnostic.open_float()](https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.open_float()).

* `[d`: Move to the previous diagnostic in the current buffer. See [:help vim.diagnostic.goto_prev()](https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.goto_prev()).

* `]d`: Move to the next diagnostic. See [:help vim.diagnostic.goto_next()](https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.goto_next()).

Source: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v1.x/doc/md/lsp.md#default-keybindings

## Neotest

[Definitions](../dot_config/nvim/after/plugin/neotest.lua)

* `<leader>t\`: show test summary window

* `<leader>tr`: runs the closest test

* `<leader>tra`: runs all tests of the current file

* `<leader>to`: get output of current test run

### Summary

* `r`: run test under the cursor

* `d`: debug

* `i`: jump to test under the cursor

* `K`: next failed

* `J`: prev failed

* `m`: mark

* `R`: run marked

* `D`: debug marked

More: `:help neovim.setup()` - summary.mappings

## Telescope

[Definitions](../dot_config/nvim/after/plugin/telescope.lua)

* `<leader>pf` - pick project files `:h telescope.builtin.find_files()`

* `<leader>paf` - pick all project files (including hidden) `:h telescope.builtin.find_files({ hidden = true })`

* `<leader>fg` - grep project files `:h telescope.builtin.live_grep()`

* `<leader>fag` - grep all project files (including hidden) `:h telescope.builtin.live_grep({ additional_args = function() { '--hidden' } end ))`

## Miscellaneous

*  `]q` - next on quick fix list `:h unimpaired`

*  `[q` - previous on quick fix list  `:h unimpaired`

