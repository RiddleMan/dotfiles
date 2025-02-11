return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    init = function()
      require("which-key").add({
        {
          "<leader>tc",

          function()
            local api = require("nvim-tree.api")
            local curr_buff = vim.api.nvim_buf_get_name(0)

            api.tree.focus()
            api.tree.find_file(curr_buff)
          end,
          desc = "Locate current file in Tree View",
        },
        {
          "<c-\\>",
          function()
            local api = require("nvim-tree.api")
            api.tree.toggle()
          end,
          desc = "Toggle Tree View",
        },
      })

      local function open_nvim_tree(data)
        local is_real_file = vim.fn.filereadable(data.file) == 1
        local is_no_name = data.file == "" and vim.bo[data.buf].buftype == ""
        local is_gitcommit = vim.bo[data.buf].filetype == "gitcommit"
        local is_gitrebase = vim.bo[data.buf].filetype == "gitrebase"
        local is_directory = vim.fn.isdirectory(data.file) == 1

        if
          (not is_real_file and not is_no_name and not is_directory)
          or is_gitcommit
          or is_gitrebase
        then
          return
        end

        local api = require("nvim-tree.api")
        if is_directory then
          vim.cmd.cd(data.file)
          api.tree.open()
        else
          api.tree.toggle({ focus = false, find_file = true })
        end
      end

      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = open_nvim_tree,
      })
    end,
    config = function()
      local function my_on_attach(bufnr)
        require("which-key").add({
          { "<leader>p", group = "project" },
          {
            "<leader>pf",
            function(opt)
              require("treeutils").launch_find_files(opt)
            end,
            desc = "Find Files",
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          },

          { "<leader>f", group = "project" },
          {
            "<leader>fg",
            function(opt)
              require("treeutils").launch_live_grep(opt)
            end,
            desc = "Grep",
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          },
        })
      end

      require("nvim-tree").setup({
        disable_netrw = true,

        filesystem_watchers = {
          ignore_dirs = { "node_modules" },
        },

        on_attach = my_on_attach,
      })
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    tag = "nightly",
  },
}
