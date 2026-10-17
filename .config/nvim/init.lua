
-- Basic settings
vim.g.mapleader = " "
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"

-- Show statusline at the bottom
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.showcmd = false

-- Transparent editor
vim.opt.winblend = 0
vim.opt.pumblend = 0

-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Dependencies
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- NvChad Base46
  {
    "nvchad/base46",
    lazy = false,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  -- NvChad UI
  {
    "nvchad/ui",
    lazy = false,
    dependencies = {
      "nvchad/base46",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvchad")
    end,
  },

  -- LSP configurations
  {
    "neovim/nvim-lspconfig",
  },
})

-- Load NvChad colors
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Hide greet
vim.opt.shortmess:append("I")

vim.opt.fillchars:append({ eob = " " })

vim.opt.guicursor = "a:block"

-- Transparent warning and error backgrounds
local hl = vim.api.nvim_set_hl

hl(0, "WarningMsg", { fg = "#e5c07b", bg = "NONE" })
hl(0, "ErrorMsg", { fg = "#e06c75", bg = "NONE" })

hl(0, "DiagnosticWarn", { fg = "#e5c07b", bg = "NONE" })
hl(0, "DiagnosticError", { fg = "#e06c75", bg = "NONE" })

hl(0, "DiagnosticVirtualTextWarn", { bg = "NONE" })
hl(0, "DiagnosticVirtualTextError", { bg = "NONE" })

-- Floating windows
hl(0, "NormalFloat", { bg = "NONE" })
hl(0, "FloatBorder", { bg = "NONE" })

hl(0, "NvimNotifyWARN", { bg = "NONE" })
hl(0, "NvimNotifyERROR", { bg = "NONE" })
hl(0, "NvimNotifyBackground", { bg = "NONE" })
