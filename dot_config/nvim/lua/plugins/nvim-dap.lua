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

return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
          ensure_installed = { "codelldb", "js", "bash" },
          handlers = {},
        },
      },
      { "mxsdev/nvim-dap-vscode-js" },
      { "rcarriga/nvim-dap-ui" },
    },
    init = function()
      -- Set of default mappings
      require("which-key").add({
        {
          "<F5>",
          function()
            require("dap").continue()
          end,
          desc = "Debugger Continue",
        },
        {
          "<F10>",
          function()
            require("dap").step_over()
          end,
          desc = "Debugger Step Over",
        },
        {
          "<F11>",
          function()
            require("dap").step_into()
          end,
          desc = "Debugger Step Into",
        },
        {
          "<F12>",
          function()
            require("dap").step_out()
          end,
          desc = "Debugger Step Out",
        },

        {
          "<leader>dr",
          function()
            require("dap").repl.open()
          end,
          desc = "Repl",
        },

        { "<leader>dl", group = "last" },
        {
          "<leader>dlr",
          function()
            require("dap").run_last()
          end,
          desc = "Run",
        },

        {
          "<leader>dh",
          function()
            require("dap.ui.widgets").hover()
          end,
          desc = "Hover",
        },

        {
          "<leader>dp",
          function()
            require("dap.ui.widgets").preview()
          end,
          desc = "Preview",
        },

        {
          "<leader>df",
          function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.frames)
          end,
          desc = "Frames",
        },

        {
          "<leader>ds",
          function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.scopes)
          end,
          desc = "Scopes",
        },

        {
          "<leader>du",
          function()
            require("dapui").toggle()
            tmux_full_screen_toggle()
          end,
          desc = "UI Toggle",
        },
        {
          "<leader>b",
          function()
            require("dap").toggle_breakpoint()
          end,
          desc = "Toggle breakpoint",
        },

        {
          "<leader>B",
          function()
            require("dap").set_breakpoint(
              nil,
              nil,
              vim.fn.input("Log point message: ")
            )
          end,
          desc = "Set breakpoint",
        },
      })
    end,
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
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
      dap.listeners.before.attach.dapui_config = function()
        tmux_full_screen_on()
        require("nvim-tree.api").tree.close()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        tmux_full_screen_on()
        require("nvim-tree.api").tree.close()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        tmux_full_screen_off()
        require("nvim-tree.api").tree.open()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        tmux_full_screen_off()
        require("nvim-tree.api").tree.open()
        dapui.close()
      end
    end,
  },
}
