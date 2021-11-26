-- Local aliases
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local fn = vim.fn
local opt = vim.opt
local bo = vim.bo

-- Set Leader key first and foremost
g.mapleader = " "
g.showcmd = true

------------------------------
-- UI
------------------------------
opt.relativenumber = true
opt.number = true
opt.showmatch = true
opt.foldmethod = "marker"
opt.splitright = true
opt.splitbelow = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- Remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- Set default tab/indentation options local to window
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true

-------------------------
-- Terminal
-------------------------
-- Open terminal to the right with :Term
-- cmd [[command! Term :botright vsplit term://$SHELL]]

-- Terminal visuals - enter insert mode & close buffer on process exit
-- cmd [[
--    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
--    autocmd TermOpen * startinsert
--    autocmd BufLeave term://* stopinsert
-- ]]


-------------------------------------------
-- LOAD KEYBINDINGS
-------------------------------------------
require("keybindings")

-------------------------------------------
-- LOAD PLUGINS
-------------------------------------------
require("plugins")
