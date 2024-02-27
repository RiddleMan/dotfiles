local is_chezmoi_path = function()
  local path = vim.loop.fs_realpath(vim.api.nvim_buf_get_name(0))
  if path then
    return path:find(vim.fn.expand("~/.local/share/chezmoi"), 1, true) == 1
  end
  return false
end

return {
  {
    "folke/neodev.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cond = function()
      local neodev_utils = require("neodev.util")

      return neodev_utils.is_nvim_config() or is_chezmoi_path()
    end,
    opts = {
      override = function(_, library)
        if is_chezmoi_path() then
          library.enabled = true
          library.plugins = true
          library.types = true
          library.runtime = true
        end
      end,
    },
  },
}
