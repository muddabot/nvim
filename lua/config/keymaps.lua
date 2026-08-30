local map = vim.keymap.set

-- Leader key (if not already set in init.lua)
vim.g.mapleader = " "

-- ============================================================
-- Basic save / quit
-- ============================================================

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit" })
map("n", "<leader>x", "<cmd>wq<CR>", { desc = "Save and quit" })
map("n", "<leader>Q", function()
	vim.cmd("qa!")
end, { desc = "Quit all (force)" })

-- ============================================================
-- Window navigation
-- ============================================================

map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

map("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window -" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window +" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Vertical resize -" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Vertical resize +" })

-- ============================================================
-- Move / join lines
-- ============================================================

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
map("n", "J", "mzJ`z", { desc = "Join lines" })

-- ============================================================
-- File explorer (Oil)
-- ============================================================

map("n", "<leader>e", function()
	require("oil").open_float()
end, { desc = "Open file explorer (Oil)" })

-- ============================================================
-- Telescope / find operations (<leader>f prefix)
-- ============================================================

map("n", "<leader>ff", function()
	require("telescope.builtin").find_files({ hidden = true })
end, { desc = "Find files (inc. hidden)" })

map("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, { desc = "Buffers" })

map("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, { desc = "Search in project" })

map("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end, { desc = "Help tags" })

map("n", "<leader><leader>f", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })
-- If using conform.nvim instead:
-- map("n", "<leader><leader>f", function()
--   require("conform").format({ async = true })
-- end, { desc = "Format buffer" })

-- ============================================================
-- Git (<leader>g prefix)
-- ============================================================

map("n", "<leader>ga", function()
	vim.cmd("Git add .")
end, { desc = "Git add all" })

map("n", "<leader>gs", function()
	vim.cmd("Git")
end, { desc = "Git status (Fugitive)" })

map("n", "<leader>gc", function()
	vim.cmd("Git commit")
end, { desc = "Git commit" })

map("n", "<leader>gp", function()
	vim.cmd("Git push")
end, { desc = "Git push" })

map("n", "<leader>gP", function()
	vim.cmd("Git pull")
end, { desc = "Git pull" })

map("n", "<leader>gd", function()
	vim.cmd("Git diff")
end, { desc = "Git diff" })

map("n", "<leader>gb", function()
	vim.cmd("Git branch")
end, { desc = "Git branches" })

map("n", "<leader>gl", function()
	vim.cmd("Git log --oneline")
end, { desc = "Git log" })

-- LazyGit (if you use it; comment out if not)
-- map("n", "<leader>gg", function()
--   require("lazygit").open()
-- end, { desc = "LazyGit" })

-- ============================================================
-- Clear search highlight
-- ============================================================

map("n", "<leader><Esc>", function()
	vim.cmd("nohlsearch")
end, { desc = "Clear search highlight" })

-- ============================================================
-- Which-key helper
-- ============================================================

map("n", "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })
