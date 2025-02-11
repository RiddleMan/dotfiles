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
      require("which-key").add({
        { "<leader>t", group = "test" },
        {
          "<leader>t\\",
          function()
            require("neotest").summary.toggle()
          end,
          desc = "Toggle summary",
        },
        {
          "<leader>tr",
          function()
            vim.cmd.write()
            require("neotest").run.run()
          end,
          desc = "Run",
        },
        { "<leader>ta", group = "all" },
        {
          "<leader>tar",
          function()
            vim.cmd.write()
            require("neotest").run.run(vim.fn.expand("%"))
          end,
          desc = "Run",
        },
        { "<leader>td", group = "debug" },
        { "<leader>tda", group = "all" },
        {
          "<leader>tdar",
          function()
            vim.cmd.write()
            require("neotest").run.run({
              vim.fn.expand("%"),
              strategy = "dap",
            })
          end,
          desc = "Run",
        },
        {
          "<leader>tdr",
          function()
            vim.cmd.write()
            require("neotest").run.run({ strategy = "dap" })
          end,
          desc = "Run",
        },
        { "<leader>tl", group = "last" },
        {
          "<leader>tlr",
          function()
            vim.cmd.write()
            require("neotest").run.run_last()
          end,
          desc = "Run",
        },
        {
          "<leader>ts",
          function()
            vim.cmd.write()
            require("neotest").run.stop()
          end,
          desc = "Stop",
        },
        {
          "<leader>to",
          function()
            require("neotest").output.open({ enter = true })
          end,
          desc = "Show Output",
        },
        {
          "<leader>tf",
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
          desc = "Open test file",
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
