local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.nvim_workspace()
lsp.ensure_installed({
  'html',
  'cssls',
  'tsserver',
  'ansiblels',
  'bashls',
  'dockerls',
  'eslint',
  'graphql',
  'jsonls',
  'marksman',
  'rust_analyzer',
  'yamlls',
  'vimls'
})

lsp.setup()
