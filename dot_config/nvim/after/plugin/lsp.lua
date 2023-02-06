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
  'ltex',
  'jsonls',
  'marksman',
  'rust_analyzer',
  'sumneko_lua',
  'yamlls',
  'vimls'
})

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

lsp.setup()
