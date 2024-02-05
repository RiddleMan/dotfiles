local neotest = require("neotest")
neotest.setup({
  adapters = {
    require("neotest-vitest"),
    require("neotest-jest"),
    require("neotest-rust"),
  },
  quickfix = {
    enabled = false,
  },
})

local bind = vim.keymap.set

bind("n", "<leader>t\\", function()
  neotest.summary.toggle()
end, {})
bind("n", "<leader>tr", function()
  vim.cmd.write()
  neotest.run.run()
end, {})
bind("n", "<leader>tar", function()
  vim.cmd.write()
  neotest.run.run(vim.fn.expand("%"))
end, {})
bind("n", "<leader>tdr", function()
  vim.cmd.write()
  neotest.run.run({ strategy = "dap" })
end, {})
bind("n", "<leader>tdar", function()
  vim.cmd.write()
  neotest.run.run({ vim.fn.expand("%"), strategy = "dap" })
end, {})
bind("n", "<leader>tlr", function()
  vim.cmd.write()
  neotest.run.run_last()
end, {})
bind("n", "<leader>ts", function()
  vim.cmd.write()
  neotest.run.stop()
end, {})
bind("n", "<leader>to", function()
  neotest.output.open({ enter = true })
end, {})
