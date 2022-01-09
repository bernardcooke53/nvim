local keymap = vim.api.nvim_set_keymap
-- Keymaps - set using vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {options})
keymap("n", "<c-s>", ":w<CR>", {})
keymap("i", "<c-s>", "<Esc>:w<CR>a", {})

local opts = { noremap = true }

-- Window navigation
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)
keymap("n", "<c-q>", "<c-w>q", opts)

-- Enter actually inserts a newline in normal mode
-- keymap("n", "<CR>", "o<Esc>", opts) -- not sure I like this one yet

-- Jump from parentheses to matching
keymap("n", "<Leader><Leader>", "%", opts)

-- Copy lines
-- keymap("n", "<Leader-Shift-j>", "y$<CR>o<CR>p<CR>", opts) -- not currently working

-- run current file in Python -- another one currently broken
-- keymap("n", ":py", ":!python3 %<CR>", opts)

-- Command line sugar for Telescope fuzzy file finding
keymap("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<Leader>fh", ":Telescope help_tags<CR>", opts)
