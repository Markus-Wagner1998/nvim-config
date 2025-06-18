return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      -- vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>p", builtin.find_files, {})
      vim.keymap.set("n", "<leader>ap", ":Telescope find_files no_ignore=true<cr>", {})
      vim.keymap.set("v", "<leader>p", '"zy:Telescope find_files search_file=<C-r>z<cr>', {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>ff", ':Telescope live_grep glob_pattern=*.{js,ts,java,sh}<cr>', {})
      vim.keymap.set("v", "<leader>fg", '"zy:Telescope live_grep default_text=<C-r>z<cr>', {})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local function filenameFirst(_, path)
        local tail = vim.fs.basename(path)
        local parent = vim.fs.dirname(path)
        if parent == "." then return tail end
        return string.format("%s\t\t%s", tail, parent)
      end

      require("telescope").setup {
        pickers = {
          find_files = { 
            path_display = filenameFirst, 
            hidden = true
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        },
        defaults = {
          file_ignore_patterns = {
            "node_modules", "dist", "yarn.lock"
          },
          {
            path_display = { "smart" }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}
