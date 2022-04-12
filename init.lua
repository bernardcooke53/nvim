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

cmd [[ "syntax enable" ]]

-- Ignore certain patterns on search
-- Nice menu when typing `:find *.py`
g.wildmode=longest,list,full
g.wildmenu = true

-- Ignore files
opt.wildignore=opt.wildignore:append("*.pyc")
opt.wildignore=opt.wildignore:append("*_build/*")
opt.wildignore=opt.wildignore:append("**/coverage/*")
opt.wildignore=opt.wildignore:append("**/node_modules/*")
opt.wildignore=opt.wildignore:append("**/android/*")
opt.wildignore=opt.wildignore:append("**/ios/*")
opt.wildignore=opt.wildignore:append("**/.git/*")


------------------------------
-- UI
------------------------------
g.termguicolors = true
opt.relativenumber = true
opt.number = true
opt.showmatch = true
opt.foldmethod = "marker"
opt.splitright = true
opt.splitbelow = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.scrolloff = 10
opt.wrap = false

-- Set default tab/indentation options local to window
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true

-- Set global Python location for nvim environment
g.python3_host_prog = "C:/Users/CookeB/AppData/Local/Programs/Python/Python310/python.exe"
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
-- LOAD PLUGINS
-------------------------------------------
require("plugins")

-------------------------------------------
-- LOAD KEYBINDINGS
-------------------------------------------
require("keybindings")

-------------------------------------------
-- LOAD COMMANDS
-------------------------------------------
-- require("commands")
