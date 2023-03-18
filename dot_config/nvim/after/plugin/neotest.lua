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

bind("n", "<leader>t\\", neotest.summary.toggle, {})
bind("n", "<leader>tr", neotest.run.run, {})
bind("n", "<leader>trr", neotest.run.run_last, {})
bind("n", "<leader>ts", neotest.run.stop, {})
bind("n", "<leader>tar", function()
  neotest.run.run(vim.fn.expand("%"))
end, {})
bind("n", "<leader>to", function()
  neotest.output.open({ enter = true })
end, {})
