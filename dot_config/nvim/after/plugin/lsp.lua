local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.nvim_workspace()
lsp.ensure_installed({
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
  "sumneko_lua",
  "yamlls",
  "vimls",
})

lsp.configure("sumneko_lua", {
  settings = {
    Lua = {
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
    },
  },
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  local bind = vim.keymap.set

  bind("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  bind("n", "<leader>K", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
end)

lsp.setup()

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_opts = lsp.build_options("null-ls", {
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
