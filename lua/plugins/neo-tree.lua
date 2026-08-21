return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",

    cmd = "Neotree",

    keys = {
      {
        "<C-e>",
        "<cmd>Neotree filesystem reveal left toggle<CR>",
        desc = "Reveal or hide Neo-tree",
      },
      {
        "<leader>e",
        "<cmd>Neotree filesystem reveal left toggle<CR>",
        desc = "File explorer",
      },
      {
        "<leader>ge",
        "<cmd>Neotree float git_status<CR>",
        desc = "Git status tree",
      },
      {
        "<leader>be",
        "<cmd>Neotree float buffers<CR>",
        desc = "Open buffers tree",
      },
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,

      source_selector = {
        winbar = true,
        statusline = false,
      },

      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
        },
        git_status = {
          symbols = {
            added = "",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },

      window = {
        position = "left",
        width = 32,
        mappings = {
          ["<space>"] = "none",
          ["l"] = "open",
          ["h"] = "close_node",
          ["Z"] = "expand_all_nodes",
          ["O"] = "system_open",
        },
      },

      filesystem = {
        bind_to_cwd = false,
        cwd_target = { sidebar = "tab", current = "window" },

        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },

        use_libuv_file_watcher = true,
        hijack_netrw_behavior = "open_current",
        group_empty_dirs = true,

        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
          hide_by_name = {
            "node_modules",
            ".git",
          },
        },
      },

      buffers = {
        follow_current_file = {
          enabled = true,
        },
        show_unloaded = true,
      },

      commands = {
        system_open = function(state)
          vim.fn.jobstart({ "xdg-open", state.tree:get_node().path }, { detach = true })
        end,
      },
    },
  },
}
