-- Options
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.tabstop = 2
-- vim.g.material_style = "deep ocean"
vim.api.nvim_set_keymap("n", "<Leader>|", ":vsplit<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>-", ":hsplit<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<S-j>", ":move '>+1<CR>gv-gv", {noremap = true })
vim.api.nvim_set_keymap("v", "<S-k>", ":move '<-1<CR>gv-gv", {noremap = true })


-- Installing lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
