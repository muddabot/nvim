return {
	-- Default: Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = false,
				term_colors = true,
				integrations = {
					treesitter = true,
					gitsigns = true,
					telescope = true,
					lualine = true,
					lazy = true,
					mason = true,
					nvimtree = true,
					indent_blankline = true,
					which_key = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	-- Optional: Tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			style = "night", -- storm, moon, night, day
			transparent = false,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = { bold = true },
				variables = {},
			},
			integrations = {
				telescope = true,
				gitsigns = true,
				lazy = true,
				mason = true,
				nvimtree = true,
				indent_blankline = true,
				which_key = true,
			},
		},
	},

	-- Optional: Gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		config = function()
			require("gruvbox").setup({
				contrast = "",
				transparent_mode = false,
				italic = {
					strings = false,
					comments = true,
					operators = false,
					folds = true,
				},
			})
		end,
	},

	-- Optional: Kanagawa
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		opts = {
			compile = false,
			transparent = false,
			italic = true,
			theme = "dragon", -- dragon, wave, lotus
			overrides = function(colors)
				return {}
			end,
		},
	},

	-- Helper: keymaps to switch colorschemes
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{
				"<leader>ct",
				function()
					local themes = {
						{ "catppuccin", "Catppuccin (default)" },
						{ "tokyonight-night", "Tokyonight Night" },
						{ "tokyonight-storm", "Tokyonight Storm" },
						{ "tokyonight-moon", "Tokyonight Moon" },
						{ "tokyonight-day", "Tokyonight Day" },
						{ "gruvbox", "Gruvbox" },
						{ "kanagawa-dragon", "Kanagawa Dragon" },
						{ "kanagawa-wave", "Kanagawa Wave" },
						{ "kanagawa-lotus", "Kanagawa Lotus" },
					}

					vim.ui.select(themes, {
						prompt = "Select colorscheme:",
						format_item = function(item)
							return item[2]
						end,
					}, function(choice)
						if choice then
							vim.cmd.colorscheme(choice[1])
						end
					end)
				end,
				desc = "Change colorscheme",
			},
		},
	},
}
