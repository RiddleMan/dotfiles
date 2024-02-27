return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "mfussenegger/nvim-dap",

      -- Adapters
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest",
    },
    cmd = "Neotest",
    init = function()
      require("which-key").register({
        ["<leader>t"] = {
          name = "+test",

          ["\\"] = {
            function()
              require("neotest").summary.toggle()
            end,
            "Toggle summary",
          },
          r = {
            function()
              vim.cmd.write()
              require("neotest").run.run()
            end,
            "Run",
          },
          a = {
            name = "+ all",
            r = {
              function()
                vim.cmd.write()
                require("neotest").run.run(vim.fn.expand("%"))
              end,
              "Run",
            },
          },
          d = {
            name = "+ debug",
            a = {
              name = "+ all",
              r = {
                function()
                  vim.cmd.write()
                  require("neotest").run.run({
                    vim.fn.expand("%"),
                    strategy = "dap",
                  })
                end,
                "Run",
              },
            },
            r = {
              function()
                vim.cmd.write()
                require("neotest").run.run({ strategy = "dap" })
              end,
              "Run",
            },
          },
          l = {
            name = "+ last",
            r = {
              function()
                vim.cmd.write()
                require("neotest").run.run_last()
              end,
              "Run",
            },
          },
          s = {
            function()
              vim.cmd.write()
              require("neotest").run.stop()
            end,
            "Stop",
          },
          o = {
            function()
              require("neotest").output.open({ enter = true })
            end,
            "Show Output",
          },
        },
      })
    end,
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vitest"),
          require("neotest-jest"),
        },
        quickfix = {
          enabled = false,
        },
      })
    end,
  },
}
