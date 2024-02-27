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
      require("which-key").register({
        ["<F5>"] = {
          function()
            require("dap").continue()
          end,
          "Debugger Continue",
        },
        ["<F10>"] = {
          function()
            require("dap").step_over()
          end,
          "Debugger Step Over",
        },
        ["<F11>"] = {
          function()
            require("dap").step_into()
          end,
          "Debugger Step Into",
        },
        ["<F12>"] = {
          function()
            require("dap").step_out()
          end,
          "Debugger Step Out",
        },

        ["<leader>d"] = {
          r = {
            function()
              require("dap").repl.open()
            end,
            "Repl",
          },

          l = {
            name = "+last",
            r = {
              function()
                require("dap").run_last()
              end,
              "Run",
            },
          },

          h = {
            function()
              require("dap.ui.widgets").hover()
            end,
            "Hover",
          },

          p = {
            function()
              require("dap.ui.widgets").preview()
            end,
            "Preview",
          },

          f = {
            function()
              local widgets = require("dap.ui.widgets")
              widgets.centered_float(widgets.frames)
            end,
            "Frames",
          },

          s = {
            function()
              local widgets = require("dap.ui.widgets")
              widgets.centered_float(widgets.scopes)
            end,
            "Scopes",
          },

          u = {
            function()
              require("dapui").toggle()
              tmux_full_screen_toggle()
            end,
            "UI Toggle",
          },
        },
        ["<leader>b"] = {
          function()
            require("dap").toggle_breakpoint()
          end,
          "Toggle breakpoint",
        },

        ["<leader>B"] = {
          function()
            require("dap").set_breakpoint(
              nil,
              nil,
              vim.fn.input("Log point message: ")
            )
          end,
          "Set breakpoint",
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
