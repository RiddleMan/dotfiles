local is_buffer_open_in_any_window = function(bufnr)
  local is_open = false
  local windows = vim.api.nvim_list_wins()
  for _, winnr in ipairs(windows) do
    if vim.api.nvim_win_get_buf(winnr) == bufnr then
      is_open = true
      break
    end
  end

  return is_open
end

local is_buffer_mofiied = function(bufnr)
  return vim.api.nvim_buf_get_option(bufnr, "modified")
end

return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {},
    init = function()
      require("which-key").add({
        { "H", vim.cmd.bprev, desc = "Previous buffer" },
        { "L", vim.cmd.bnext, desc = "Next buffer" },
        {
          "<leader>cab",
          function()
            local buffers = vim.api.nvim_list_bufs()

            for _, bufnr in ipairs(buffers) do
              if
                not is_buffer_open_in_any_window(bufnr)
                and not is_buffer_mofiied(bufnr)
              then
                vim.api.nvim_buf_delete(bufnr, { force = false })
              end
            end

            require("bufferline.ui").refresh()
          end,
          desc = "Close all unmodified buffers",
        },
      })
    end,
  },
}
