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
    use 'KarlWithK/rust-tools.nvim'
    use 'kabouzeid/nvim-lspinstall'
    use 'hrsh7th/nvim-compe'
    use 'onsails/lspkind-nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'SirVer/ultisnips'

    -- A fuzzy file finder
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {"nvim-lua/popup.nvim"},
            {"nvim-lua/plenary.nvim"}
        }
    }
    -- Comment/Uncomment tool
    use "scrooloose/nerdcommenter"
    -- Switch to the begining and the end of a block by pressing %
    use "tmhedberg/matchit"
    -- A Tree-like side bar for better navigation
    use "scrooloose/nerdtree"
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


