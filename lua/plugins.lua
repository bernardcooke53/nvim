require("packer").startup(function()
    use "wbthomason/packer.nvim"
    use {
        "vimwiki/vimwiki",
        config = function()
        vim.g.vimwiki_list = {
            {
                path = "~/dev/vimwiki/",
                syntax = "markdown",
                ext = ".md",
            }
        }

        vim.g.vimwiki_ext2syntax = {
            [".md"] = "markdown",
            [".markdown"] = "markdown",
            [".mdown"] = "markdown",
        }
        end
    }
    -- LSP and completion
    use "neovim/nvim-lspconfig"
    use "nvim-lua/completion-nvim"
    -- Lua Development
    use "tjdevries/nlua.nvim"
    use "psf/black"
    use "simrat39/rust-tools.nvim"
    use "kabouzeid/nvim-lspinstall"
    use "hrsh7th/nvim-compe"
    use "onsails/lspkind-nvim"
    use "ray-x/lsp_signature.nvim"
    use "SirVer/ultisnips"

    -- JSONC highlighting
    use "neoclide/jsonc.vim"

    -- Terraform
    -- N.B. - filename too long error on Windows
    -- use "hashicorp/terraform-ls"

    -- A fuzzy file finder
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {"nvim-lua/popup.nvim"},
            {"nvim-lua/plenary.nvim"},
            {"BurntSushi/ripgrep"},
            {"sharkdp/fd"}
        }
    }
    -- Comment/Uncomment tool
    use "scrooloose/nerdcommenter"
    -- Switch to the begining and the end of a block by pressing %
    use "tmhedberg/matchit"
    -- A Tree-like side bar for better navigation
    use {
        "preservim/nerdtree",
        config = function()
            -- Show hidden files by default
            vim.g.NERDTreeShowHidden = 1 
        end
    }
    -- A cool status bar
    use "vim-airline/vim-airline"
    -- Airline themes
    use "vim-airline/vim-airline-themes"
    -- Nord
    use "arcticicestudio/nord-vim"
    -- Better syntax-highlighting for filetypes in vim
    use "sheerun/vim-polyglot"
    -- Intellisense engine
    use {"neoclide/coc.nvim", branch = "release"}
    -- Git integration
    use "tpope/vim-fugitive"
    -- Auto-close braces and scopes
   use "jiangmiao/auto-pairs"

end
)

-- require("telescope").setup{
--     defaults = {
--         file_ignore_patterns = { ".git" }
--     }
-- }

local nvim_lsp = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

local servers = { "pyright", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
end

