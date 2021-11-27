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
    use "neovim/nvim-lspconfig"
    use "psf/black"

    -- A fuzzy file finder
    use "kien/ctrlp.vim"
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


