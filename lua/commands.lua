-- Local aliases
local cmd = vim.cmd

-- Remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- Shortcut for config
-- cmd [[command !Cfg :vsp $HOME/.config/nvim/ ]]
