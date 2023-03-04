local neotest = require("neotest")
neotest.setup({
  adapters = {
    require("neotest-vitest"),
    require("neotest-jest"),
    require("neotest-rust"),
  },
})

local bind = vim.keymap.set

bind("n", "<leader>t\\", neotest.summary.toggle, {})
bind("n", "<leader>tr", neotest.run.run, {})
bind("n", "<leader>tra", function()
  neotest.run.run(vim.fn.expand("%"))
end, {})
bind("n", "<leader>to", function()
  neotest.output.open({ enter = true })
end, {})
