local is_chezmoi_path = function()
  local path = vim.loop.fs_realpath(vim.api.nvim_buf_get_name(0))
  if path then
    return path:find(vim.fn.expand("~/.local/share/chezmoi"), 1, true) == 1
  end
  return false
end

return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
      vim.g.lsp_zero_extend_null_ls = 0
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",

      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        opts = {},
      },

      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },

    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_cmp()

      lsp_zero.set_sign_icons({
        error = "✘",
        warn = "▲",
        hint = "⚑",
        info = "",
      })

      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()
      local cmp_action = lsp_zero.cmp_action()
      local cmp_format = require("lspkind").cmp_format({
        mode = "symbol",
        max_width = 50,
        symbol_map = { Copilot = "" },
        ellipsis_char = "...",
      })

      cmp.setup({
        preselect = "item",
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        sources = {
          { name = "copilot", group_index = 2 },
          { name = "path" },
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "buffer", keyword_length = 3 },
          { name = "luasnip", keyword_length = 2 },
        },
        window = {
          documentation = cmp.config.window.bordered(),
        },
        formatting = { format = cmp_format },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-e>"] = cmp.mapping.abort(),

          ["<Tab>"] = cmp_action.luasnip_supertab(),
          ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),

          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
        sorting = {
          priority_weight = 2,
          comparators = {
            require("copilot_cmp.comparators").prioritize,

            -- Below is the default comparator list and order for nvim-cmp
            cmp.config.compare.offset,
            -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
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
    end,
  },

  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim",
      {
        "folke/neodev.nvim",
        cond = function()
          local neodev_utils = require("neodev.util")

          return neodev_utils.is_nvim_config() or is_chezmoi_path()
        end,
        opts = {
          override = function(_, library)
            if is_chezmoi_path() then
              library.enabled = true
              library.plugins = true
              library.types = true
              library.runtime = true
            end
          end,
        },
      },
    },
    config = function()
      local wk = require("which-key")
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })

        wk.register({
          ["<leader>"] = {
            r = {
              vim.lsp.buf.rename,
              "Rename",
              buffer = bufnr,
            },
            K = {
              vim.lsp.buf.signature_help,
              "Symbol signature",
              buffer = bufnr,
            },
          },
        })
      end)

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
          "lua_ls",
          "yamlls",
          "vimls",
        },
        handlers = {
          lsp_zero.default_setup,
        },
      })
    end,
  },
}
