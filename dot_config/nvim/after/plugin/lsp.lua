local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  local bind = vim.keymap.set

  lsp_zero.default_keymaps({ buffer = bufnr })
  bind("n", "<leader>r", vim.lsp.buf.rename, opts)
  bind("n", "<leader>K", vim.lsp.buf.signature_help, opts)
end)

require("neodev").setup({
  override = function(root_dir, library)
    if
      root_dir:find("~/.local/share/chezmoi/dot_config/nvim", 1, true) == 1
    then
      library.enabled = true
      library.plugins = true
    end
  end,
})

require("mason").setup({})
require("mason-nvim-dap").setup({
  ensure_installed = { "codelldb", "js", "bash" },
  handlers = {},
})
require("mason-lspconfig").setup({
  -- List of language servers: https://github.com/neovim/nvim-lsp_zero.onfig/blob/master/doc/server_configurations.md
  ensure_installed = {
    "html",
    "cssls",
    "tsserver",
    "ansiblels",
    "bashls",
    "dockerls",
    "eslint",
    "graphql",
    "ltex",
    "jsonls",
    "marksman",
    "rust_analyzer",
    "lua_ls",
    "yamlls",
    "vimls",
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls({
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
        completion = {
          callSnippet = "Replace",
        },
      })
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
  },
})

lsp_zero.set_sign_icons({
  error = "✘",
  warn = "▲",
  hint = "⚑",
  info = "",
})

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()
local cmp_action = require("lsp-zero").cmp_action()
local cmp_format = require("lsp-zero").cmp_format({
  format = {
    mode = "symbol",
    max_width = 50,
    symbol_map = { Copilot = "" },
  },
})

cmp.setup({
  preselect = "item",
  sources = {
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "copilot", group_index = 2 },
    { name = "buffer", keyword_length = 3 },
    { name = "luasnip", keyword_length = 2 },
  },
  window = {
    documentation = cmp.config.window.bordered(),
  },
  formatting = cmp_format,
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-e>"] = cmp.mapping.abort(),

    ["<Tab>"] = cmp_action.luasnip_jump_forward(),
    ["<S-Tab>"] = cmp_action.luasnip_jump_backward(),
  }),
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_opts = lsp_zero.build_options("null-ls", {
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(c)
              return c.name == "null-ls"
            end,
          })
        end,
      })
    end
  end,
})

local null_ls = require("null-ls")
null_ls.setup({
  on_attach = null_opts.on_attach,
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.rustfmt.with({
      extra_args = { "--edition=2021" },
    }),
  },
})
