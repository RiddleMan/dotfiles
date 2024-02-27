return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
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
      })
    end,
    dependencies = {
      {
        "jay-babu/mason-null-ls.nvim",
        opts = {
          ensure_installed = {
            "stylua",
            "prettier",
            "shfmt",
          },
          automatic_installation = false,
          handlers = {},
        },
      },
    },
  },
}
