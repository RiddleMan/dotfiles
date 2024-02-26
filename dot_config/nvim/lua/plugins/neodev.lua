return {
  {
    "folke/neodev.nvim",
    opts = {},
    config = function()
      require("neodev").setup({
        override = function(root_dir, library)
          if
            root_dir:find("~/.local/share/chezmoi/dot_config/nvim", 1, true)
            == 1
          then
            library.enabled = true
            library.plugins = true
          end
        end,
      })
    end,
  },
}
