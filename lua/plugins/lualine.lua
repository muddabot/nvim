-- ~/.config/nvim/lua/plugins/lualine.lua
-- lazy.nvim spec for lualine.nvim

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"catppuccin/nvim",
	},
	event = "VeryLazy",
	init = function()
		vim.opt.showmode = false
		vim.opt.laststatus = 3 -- global statusline
	end,
	opts = {
		options = {
			theme = "auto",
			globalstatus = true,
			icons_enabled = true,
			component_separators = { left = "│", right = "│" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {
					"alpha",
					"dashboard",
					"starter",
					"snacks_dashboard",
				},
				winbar = {},
			},
			refresh = { statusline = 250 },
		},

		sections = {
			lualine_a = {
				{
					"mode",
					padding = { left = 1, right = 1 },
				},
			},
			lualine_b = {
				{
					"branch",
					icon = " ",
					padding = { left = 1, right = 1 },
				},
				{
					"diff",
					symbols = {
						added = " ",
						modified = " ",
						removed = " ",
					},
					source = function()
						local gs = vim.b.gitsigns_status_dict
						if gs then
							return { added = gs.added, modified = gs.changed, removed = gs.removed }
						end
					end,
					padding = { left = 1, right = 1 },
				},
			},
			lualine_c = {
				{
					"filetype",
					icon_only = false,
					colored = true,
					padding = { left = 1, right = 0 },
				},
				{
					"filename",
					path = 1,
					symbols = {
						modified = " ●",
						readonly = " 󰌾 ",
						unnamed = "[No Name]",
					},
					padding = { left = 1, right = 1 },
				},
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = {
						Error = " ",
						Warn = " ",
						Info = " ",
						Hint = "󰌵 ",
					},
					update_in_insert = false,
					padding = { left = 1, right = 1 },
				},
				{
					function()
						local reg = vim.fn.reg_recording()
						if reg == "" then
							return ""
						end
						return "󰑋 @" .. reg
					end,
					color = { fg = "#ff9e64", gui = "bold" },
					padding = { left = 1, right = 1 },
				},
			},
			lualine_x = {
				{
					function()
						local buf = vim.api.nvim_get_current_buf()
						local names = {}
						for _, client in ipairs(vim.lsp.get_clients({ bufnr = buf })) do
							if client.name ~= "null-ls" and client.name ~= "copilot" then
								table.insert(names, client.name)
							end
						end
						if #names == 0 then
							return ""
						end
						return " " .. table.concat(names, ", ")
					end,
					cond = function()
						return #vim.lsp.get_clients({ bufnr = 0 }) > 0
					end,
					padding = { left = 1, right = 1 },
				},
				{
					function()
						local ok, lazy = pcall(require, "lazy")
						if not ok then
							return ""
						end
						local stats = lazy.stats()
						if not stats or stats.pending == 0 then
							return ""
						end
						return "󰒲 " .. stats.pending
					end,
					cond = function()
						local ok, lazy = pcall(require, "lazy")
						if not ok then
							return false
						end
						local stats = lazy.stats()
						return stats and stats.pending and stats.pending > 0
					end,
					color = { fg = "#f38ba8", gui = "bold" },
					padding = { left = 1, right = 1 },
				},
				{
					function()
						if vim.bo.expandtab then
							return " spaces:" .. vim.bo.shiftwidth
						end
						return " tabs:" .. vim.bo.tabstop
					end,
					padding = { left = 1, right = 1 },
				},
				{
					"encoding",
					fmt = string.upper,
					cond = function()
						return vim.bo.fileencoding ~= "utf-8"
					end,
					icon = " ",
					padding = { left = 1, right = 1 },
				},
				{
					"fileformat",
					symbols = {
						unix = "LF",
						dos = "CRLF",
						mac = "CR",
					},
					icon = "",
					padding = { left = 1, right = 1 },
				},
			},
			lualine_y = {
				{
					"progress",
					separator = " ",
					padding = { left = 1, right = 0 },
				},
				{
					"location",
					padding = { left = 0, right = 1 },
				},
			},
			lualine_z = {
				{
					function()
						return " " .. os.date("%H:%M")
					end,
					padding = { left = 1, right = 1 },
				},
			},
		},

		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},

		extensions = {
			"lazy",
			"mason",
			"quickfix",
			"fugitive",
			"trouble",
			"nvim-tree",
			"toggleterm",
		},
	},
}
