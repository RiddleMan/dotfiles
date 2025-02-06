return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
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
          f = {
            function()
              local file =
                vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
              local basename = vim.fn.fnamemodify(file, ":p:r")
              local ext = vim.fn.fnamemodify(file, ":e")

              local spec = basename .. ".spec." .. ext
              local test = basename .. ".test." .. ext

              if vim.fn.filereadable(spec) == 1 then
                vim.cmd("e " .. spec)
              elseif vim.fn.filereadable(test) == 1 then
                vim.cmd("e " .. test)
              else
                local answer =
                  vim.fn.input("No spec file found. Create a test file? (y/N) ")

                if answer == "y" or answer == "Y" then
                  vim.cmd("e " .. spec)
                end
              end
            end,
            "Open test file",
          },
        },
      })
    end,
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vitest"),
          require("neotest-jest"),
          require("rustaceanvim.neotest"),
        },
        quickfix = {
          enabled = false,
        },
      })
    end,
  },
}
