local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- add LazyVim and import its plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        -- import/override with your plugins
        { import = "plugins" },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = { enabled = true }, -- automatically check for plugin updates
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

vim.filetype.add({
    extension = {
        tf = "terraform",
        j2 = "jinja",
        ["*.j2"] = "jinja",
    },
    -- filename = {
    --   ["Foofile"] = "fooscript",
    -- },
    -- pattern = {
    --   ["~/%.config/foo/.*"] = "fooscript",
    -- },
})

local opts = { noremap = true }

-- Set m key for cutting text - https://github.com/svermeulen/vim-cutlass
vim.api.nvim_set_keymap("n", "m", "d", opts)
vim.api.nvim_set_keymap("n", "mm", "dd", opts)
vim.api.nvim_set_keymap("x", "m", "d", opts)
vim.api.nvim_set_keymap("x", "mm", "dd", opts)

-- Set options

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.spell = false
vim.opt.signcolumn = "auto"
vim.opt.wrap = false

vim.g.autoformat_enabled = true -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
vim.g.cmp_enabled = true -- enable completion at start
vim.g.autopairs_enabled = true -- enable autopairs at start
vim.g.diagnostics_mode = 3 -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
vim.g.icons_enabled = true -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
vim.g.ui_notifications_enabled = true -- disable notifications when toggling UI elements
vim.g.python_host_prog = "/usr/local/bin/python3" -- set global host program for python
vim.g.python3_host_prog = "/usr/local/bin/python3" -- set global host program for python3
