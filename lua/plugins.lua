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
end
)


