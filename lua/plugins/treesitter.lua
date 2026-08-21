return {
  {
    "nvim-treesitter/nvim-treesitter",

    event = { "BufReadPost", "BufNewFile" },

    build = ":TSUpdate",

    config = function()
      local treesitter = require("nvim-treesitter")

      local languages = {
        "bash",
        "c",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "rust",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      }

      treesitter.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      treesitter.install(languages)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = languages,
        callback = function(args)
          local ok, err = pcall(vim.treesitter.start, args.buf)

          if not ok then
            vim.notify(
              "Treesitter could not start for "
              .. vim.bo[args.buf].filetype
              .. ": "
              .. err,
              vim.log.levels.WARN
            )
          end
        end,
      })
    end,
  },
}
