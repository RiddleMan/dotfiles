return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",

      -- Adapters
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest",
      "rouge8/neotest-rust",
    },
    cmd = "Neotest",
    init = function()
      local bind = vim.keymap.set

      bind("n", "<leader>t\\", function()
        require("neotest").summary.toggle()
      end, {})
      bind("n", "<leader>tr", function()
        vim.cmd.write()
        require("neotest").run.run()
      end, {})
      bind("n", "<leader>tar", function()
        vim.cmd.write()
        require("neotest").run.run(vim.fn.expand("%"))
      end, {})
      bind("n", "<leader>tdr", function()
        vim.cmd.write()
        require("neotest").run.run({ strategy = "dap" })
      end, {})
      bind("n", "<leader>tdar", function()
        vim.cmd.write()
        require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
      end, {})
      bind("n", "<leader>tlr", function()
        vim.cmd.write()
        require("neotest").run.run_last()
      end, {})
      bind("n", "<leader>ts", function()
        vim.cmd.write()
        require("neotest").run.stop()
      end, {})
      bind("n", "<leader>to", function()
        require("neotest").output.open({ enter = true })
      end, {})
    end,
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vitest"),
          require("neotest-jest"),
          require("neotest-rust"),
        },
        quickfix = {
          enabled = false,
        },
      })
    end,
  },
}
