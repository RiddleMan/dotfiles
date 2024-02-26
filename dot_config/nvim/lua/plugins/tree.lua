return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      local function my_on_attach(bufnr)
        local function opts(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        vim.keymap.set("n", "<Leader>pf", function(options)
          require("treeutils").launch_find_files(options)
        end, opts("Launch Find Files"))
        vim.keymap.set("n", "<Leader>fg", function(options)
          require("treeutils").launch_live_grep(options)
        end, opts("Launch Live Grep"))
      end

      require("nvim-tree").setup({
        disable_netrw = true,

        filesystem_watchers = {
          ignore_dirs = { "node_modules" },
        },

        on_attach = my_on_attach,
      })
      local api = require("nvim-tree.api")

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

      local function open_current_file_in_tree()
        local curr_buff = vim.api.nvim_buf_get_name(0)

        api.tree.focus()
        api.tree.find_file(curr_buff)
      end

      vim.keymap.set("n", "<leader>tc", open_current_file_in_tree, {})

      vim.keymap.set("n", "<c-\\>", api.tree.toggle, {})
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    tag = "nightly",
  },
}