return {
  {
    "nvimtools/none-ls.nvim",
    event = "InsertEnter",
    cmd = { "NullLsInfo", "NullLsLog" },
    config = function()
      local lsp_zero = require("lsp-zero")
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
    end,
    dependencies = { "VonHeikemen/lsp-zero.nvim" },
  },
}
