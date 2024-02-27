return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "williamboman/mason.nvim", opts = {} },
      { "williamboman/mason-lspconfig.nvim" },

      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
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
        event = "InsertEnter",
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

      lsp_zero.on_attach(function(_, bufnr)
        local opts = { buffer = bufnr }
        local bind = vim.keymap.set

        lsp_zero.default_keymaps({ buffer = bufnr })
        bind("n", "<leader>r", vim.lsp.buf.rename, opts)
        bind("n", "<leader>K", vim.lsp.buf.signature_help, opts)
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
}
