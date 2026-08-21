local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal",      { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalNC",    { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Pmenu",       { bg = "NONE" })
    vim.api.nvim_set_hl(0, "SignColumn",  { bg = "NONE" })
  end,
})
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("keymaps")

require("lazy").setup({
  {
    import = "plugins",
  },
}, {
  defaults = {
    lazy = true,
  },

  install = {
    colorscheme = {
      "catppuccin",
    },
  },

  checker = {
    enabled = true,
    notify = false,
  },

  change_detection = {
    notify = false,
  },

  ui = {
    border = "rounded",
  },
})
