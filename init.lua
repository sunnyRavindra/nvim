vim.cmd([[
  highlight Error guibg=red
  highlight link Warning Error
  set expandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set smarttab
  set number
  set relativenumber
]])

vim.g.mapleader = " "

-- Install Lazy package manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require'lspconfig'.lua_ls.setup{}
require("mason").setup()
require("cmp").setup()
require('lualine').setup()
require('which-key').setup()
require("ibl").setup()
