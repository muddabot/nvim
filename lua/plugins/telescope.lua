return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    build = function()
      pcall(vim.fn.system, {
        "make",
        "-C",
        vim.fn.stdpath("data") .. "/lazy/telescope-fzf-native.nvim",
      })
    end,
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({
            hidden = true,
          })
        end,
        desc = "Find files, including hidden files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep({
            cwd = vim.fn.stdpath("config"),
            additional_args = function()
              return { "--hidden" }
            end,
          })
        end,
        desc = "Search Neovim config",
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<CR>",
        desc = "Buffers",
      },
      {
        "<leader>fh",
        "<cmd>Telescope help_tags<CR>",
        desc = "Help tags",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            preview_width = 0.55,
          },
        },
        sorting_strategy = "ascending",
        winblend = 0,
        border = true,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
          n = {
            ["q"] = require("telescope.actions").close,
          },
        },

        file_ignore_patterns = { "node_modules", ".git", "build", "dist" },
        preview = {
          hide_on_startup = false,
        },

        set_env = { ["COLORTERM"] = "truecolor" },
        color_devicons = true,
        file_previewer = require("telescope.previewers").buffer_previewer_maker,
        git_worktrees = nil,

        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        selection_caret = "▍ ",
        entry_prefix = "  ",
        initial_mode = "insert",
        prompt_prefix = "   ",
        selection_strategy = "reset",
        dynamic_preview_title = true,
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        },
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
        buffers = {
          initial_mode = "normal",
          sort_lastused = true,
          mappings = {
            n = {
              ["d"] = require("telescope.actions").delete_buffer,
            },
          },
        },
        help_tags = {
          theme = "dropdown",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")

      telescope.setup(opts)

      pcall(telescope.load_extension, "fzf")
    end,
  },
}
