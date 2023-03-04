require("neotest").setup({
  adapters = {
    require("neotest-jest"),
    require("neotest-vitest"),
    require("neotest-rust"),
  },
})
