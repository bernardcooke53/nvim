return {
    { "machakann/vim-sandwich" },
    { "svermeulen/vim-cutlass", lazy = false },
    { "lepture/vim-jinja" },
    { "junegunn/fzf.vim" },
    { "prettier/vim-prettier" },
    {
        "kosayoda/nvim-lightbulb",
        require = "antoinemadec/FixCursorHold.nvim",
        opts = function(opts)
            opts.autocmd = { enabled = true }
        end,
    },
    {
        "stevearc/oil.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {
                "<leader>o",
                function()
                    vim.cmd("vsplit")
                    local win = vim.api.nvim_get_current_win()
                    local buf = vim.api.nvim_create_buf(true, true)
                    vim.api.nvim_win_set_buf(win, buf)
                    require("oil").open()
                end,
                desc = "[O]pen folder view to the right",
            },
        },
        opts = {
            default_file_explorer = false,
            view_options = {
                show_hidden = true,
            },
        },
    },
    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
        },
    },
    { "astral-sh/ruff-lsp" },
    -- add tsserver and setup with typescript.nvim instead of lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/typescript.nvim",
            init = function()
                require("lazyvim.util").lsp.on_attach(function(_, buffer)
                    -- stylua: ignore
                    vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
                    vim.keymap.set(
                        "n",
                        "<leader>cR",
                        "TypescriptRenameFile",
                        { desc = "Rename File", buffer = buffer }
                    )
                end)
            end,
        },
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- tsserver will be automatically installed with mason and loaded with lspconfig
                tsserver = {},
                pyright = {
                    settings = {
                        autoImportCompletion = true,
                        disableOrganiseImports = true,
                    },
                    python = {
                        analysis = {
                            ignore = { "*" },
                        },
                    },
                },
                ruff_lsp = {},
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with typescript.nvim
                tsserver = function(_, opts)
                    require("typescript").setup({ server = opts })
                    return true
                end,
                ["ruff-lsp"] = function(_, opts)
                    require("ruff_lsp").setup({ server = opts })
                    return true
                end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        },
    },
    -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
    { import = "lazyvim.plugins.extras.lang.json" },
    -- add any tools you want to have installed below
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
            },
        },
    },

    -- Use <tab> for completion and snippets (supertab)
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-emoji",
        },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api
                            .nvim_buf_get_lines(0, line - 1, line, true)[1]
                            :sub(col, col)
                            :match("%s")
                        == nil
            end

            local cmp = require("cmp")

            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif vim.snippet.active({ direction = 1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(1)
                        end)
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif vim.snippet.active({ direction = -1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(-1)
                        end)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            })
        end,
    },
}
