local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit" })
map("n", "<leader>x", "<cmd>wq<CR>", { desc = "Save and quit" })

map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
map("n", "J", "mzJ`z", { desc = "Join lines" })

map("n", "<leader>e", function()
	require("oil").open_float() -- Leader key
	vim.g.mapleader = " "

	-- Save and quit helpers
	vim.keymap.set("n", "<leader>w", vim.cmd.write, { desc = "Save file" })
	vim.keymap.set("n", "<leader>q", vim.cmd.quit, { desc = "Quit" })
	vim.keymap.set("n", "<leader>Q", function()
		vim.cmd("qa!")
	end, { desc = "Quit all (force)" })

	-- ============================================================
	-- File operations (<leader>f as prefix only, no direct action)
	-- ============================================================

	-- Find files (Telescope or your finder)
	vim.keymap.set("n", "<leader>ff", function()
		require("telescope.builtin").find_files({ hidden = true })
	end, { desc = "Find files (inc. hidden)" })

	-- Find in buffers
	vim.keymap.set("n", "<leader>fb", function()
		require("telescope.builtin").buffers()
	end, { desc = "Buffers" })

	-- Grep / search in project
	vim.keymap.set("n", "<leader>fg", function()
		require("telescope.builtin").live_grep()
	end, { desc = "Search in project" })

	-- Help tags
	vim.keymap.set("n", "<leader>fh", function()
		require("telescope.builtin").help_tags()
	end, { desc = "Help tags" })

	-- Format buffer (moved off <leader>f to avoid prefix conflict)
	vim.keymap.set("n", "<leader><leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, { desc = "Format buffer" })
	-- or, if you use conform.nvim:
	-- vim.keymap.set("n", "<leader><leader>f", function()
	--   require("conform").format({ async = true })
	-- end, { desc = "Format buffer" })

	-- ============================================================
	-- Git (<leader>g prefix)
	-- ============================================================

	-- Open Git status / Fugitive overview
	vim.keymap.set("n", "<leader>gs", function()
		vim.cmd("Git")
	end, { desc = "Git status (Fugitive)" })

	-- Git commit (opens commit buffer)
	vim.keymap.set("n", "<leader>gc", function()
		vim.cmd("Git commit")
	end, { desc = "Git commit" })

	-- Git push
	vim.keymap.set("n", "<leader>gp", function()
		vim.cmd("Git push")
	end, { desc = "Git push" })

	-- Git pull
	vim.keymap.set("n", "<leader>gP", function()
		vim.cmd("Git pull")
	end, { desc = "Git pull" })

	-- Git diff
	vim.keymap.set("n", "<leader>gd", function()
		vim.cmd("Git diff")
	end, { desc = "Git diff" })

	-- Git branches
	vim.keymap.set("n", "<leader>gb", function()
		vim.cmd("Git branch")
	end, { desc = "Git branches" })

	-- Git log
	vim.keymap.set("n", "<leader>gl", function()
		vim.cmd("Git log --oneline")
	end, { desc = "Git log" })

	-- If you use LazyGit:
	-- vim.keymap.set("n", "<leader>gg", function()
	--   require("lazygit").open()
	-- end, { desc = "LazyGit" })

	-- ============================================================
	-- Editing / navigation
	-- ============================================================

	-- Better window navigation
	vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
	vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
	vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
	vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })

	-- Resize windows
	vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window -" })
	vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window +" })
	vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Vertical resize -" })
	vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Vertical resize +" })

	-- Clear search highlight
	vim.keymap.set("n", "<leader><Esc>", function()
		vim.cmd("nohlsearch")
	end, { desc = "Clear search highlight" })

	-- ============================================================
	-- Commenting (if using Comment.nvim or similar)
	-- ============================================================

	-- Example for Comment.nvim (adjust if you already have gc/gcc)
	-- vim.keymap.set("n", "gc", function()
	--   require("Comment.api").toggle.linewise.count()
	-- end, { desc = "Toggle comment line" })
	-- vim.keymap.set("x", "gc", function()
	--   require("Comment.api").toggle.linewise(vim.fn.visualmode())
	-- end, { desc = "Toggle comment selection" })

	-- ============================================================
	-- Which-key helper
	-- ============================================================

	vim.keymap.set("n", "<leader>?", function()
		require("which-key").show({ global = false })
	end, { desc = "Buffer Local Keymaps (which-key)" })
end, { desc = "Open file explorer" })
