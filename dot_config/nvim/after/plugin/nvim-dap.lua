-- Set of default mappings
vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
  require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>b", function()
  require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>B", function()
  require("dap").set_breakpoint()
end)
vim.keymap.set("n", "<Leader>lp", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>dr", function()
  require("dap").repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
  require("dap").run_last()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
  require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<Leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)

local dap = require("dap")

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      vim.fn.expand(
        "~/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"
      ),
      "${port}",
    },
  },
}

local dapui = require("dapui")
local treeapi = require("nvim-tree.api")
dapui.setup()

local tmux_full_screen_on = function()
  vim.cmd(
    "silent ! [ -n \"$TMUX\" ] && \\! tmux list-panes -F '\\#F' | grep -q Z && tmux resize-pane -Z"
  )
end

local tmux_full_screen_off = function()
  vim.cmd(
    "silent ![ -n \"$TMUX\" ] && tmux list-panes -F '\\#F' | grep -q Z && tmux resize-pane -Z"
  )
end

local tmux_full_screen_toggle = function()
  vim.cmd("silent ! [ -n \"$TMUX\" ] && tmux resize-pane -Z")
end

dap.listeners.before.attach.dapui_config = function()
  tmux_full_screen_on()
  treeapi.tree.close()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  tmux_full_screen_on()
  treeapi.tree.close()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  tmux_full_screen_off()
  treeapi.tree.open()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  tmux_full_screen_off()
  treeapi.tree.open()
  dapui.close()
end

vim.keymap.set("n", "<Leader>du", function()
  dapui.toggle()
  tmux_full_screen_toggle()
end)
