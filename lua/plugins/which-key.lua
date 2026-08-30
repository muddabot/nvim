return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,

		triggers = {
			{ "<leader>", mode = { "n", "v", "o" } },
			-- add "i", "t", "c" here if you want which-key in those modes too
		},

		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = true,
				motions = true,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},

		win = {
			border = "rounded",
			padding = { 2, 2, 2, 2 },
			title = true,
			title_pos = "center",
		},

		layout = {
			align = "center",
			spacing = 3,
			width = nil,
			height = nil,
		},

		sort = {
			"local",
			"order",
			"group",
			"alphanum",
			"mod",
			"lower",
			"icase",
			"desc",
			"manual",
		},

		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "",
			ellipsis = "…",
			mappings = true,
			colors = true,
			keys = {},
		},

		show_help = true,
		show_keys = true,
	},

	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
