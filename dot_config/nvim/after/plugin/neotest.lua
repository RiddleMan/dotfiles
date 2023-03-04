local neotest = require("neotest")
neotest.setup({
  adapters = {
    require("neotest-vitest"),
    require("neotest-jest"),
    require("neotest-rust"),
  },
})
