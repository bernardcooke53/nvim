local vsplit_win_size = 60
return {
    {
        "akinsho/toggleterm.nvim",
        opts = {--[[ things you want to change go here]]
        },
        config = true,
        keys = {
            {
                "<leader>tt",
                function()
                    vim.cmd.TermSelect({})
                end,
                desc = "Select [T]erminal",
            },
            {
                "<leader>ta",
                function()
                    vim.cmd.ToggleTermToggleAll({})
                end,
                desc = "Toggle [A]ll Terminals",
            },
            {
                "<leader>th",
                function()
                    vim.cmd.ToggleTerm({
                        args = {
                            string.format("size=%d", vsplit_win_size),
                            'direction="vertical"',
                            string.format("dir=%s", vim.fn.getcwd()),
                        },
                    })
                end,
                desc = "Toggle [H]orizontal Terminal",
            },
            {
                "<leader>tp",
                function()
                    local python3 = vim.fn.executable("python3") == 1 and "python3"
                    if python3 then
                        return vim.cmd.TermExec({
                            args = {
                                "cmd=python3",
                                string.format("size=%d", vsplit_win_size),
                                "name=python3",
                                'direction="vertical"',
                                string.format("dir=%s", vim.fn.getcwd()),
                            },
                        })
                        -- TODO: this would set insert mode, but we are still in the wrong buffer
                        -- local keys = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
                        -- vim.api.nvim_feedkeys(keys, "i", true)
                    end
                    local python = vim.fn.executable("python") == 1 and "python"
                    if python then
                        vim.cmd.TermExec({
                            args = {
                                "cmd=python",
                                string.format("size=%d", vsplit_win_size),
                                "name=python",
                                'direction="vertical"',
                                string.format("dir=%s", vim.fn.getcwd()),
                            },
                        })
                        -- TODO: this would set insert mode, but we are still in the wrong buffer
                        -- local keys = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
                        -- vim.api.nvim_feedkeys(keys, "i", true)
                    end
                end,
                desc = "ToggleTerm python",
            },
        },
        lazy = false,
    },
    {
        "stevearc/overseer.nvim",
        opts = {},
        dependencies = {
            "stevearc/dressing.nvim",
            "rcarriga/nvim-notify",
            "nvim-telescope/telescope.nvim",
        },
        keys = {
            {
                "<leader>oo",
                function()
                    return vim.cmd.OverseerRun({})
                end,
                desc = "Run [O]verseer task",
            },
            {
                "<leader>oa",
                function()
                    require("overseer").toggle({
                        direction = "right",
                    })
                end,
                desc = "[O]verseer - List [A]ll tasks",
            },
        },
    },
    { "machakann/vim-sandwich" },
    { "svermeulen/vim-cutlass", lazy = false },
    { "lepture/vim-jinja" },
    { "numToStr/Comment.nvim" },
    { "junegunn/fzf.vim" },
    { "prettier/vim-prettier" },
    { "ThePrimeagen/vim-be-good" },
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false,
        keys = {
            {
                "<leader>hh",
                function()
                    require("harpoon.ui").toggle_quick_menu()
                end,
                desc = "Toggle [H]arpoon quick menu",
            },
            {
                "<leader>hn",
                function()
                    require("harpoon.ui").nav_next()
                end,
                desc = "(Harpoon) next mark",
            },
            {
                "<leader>hb",
                function()
                    require("harpoon.ui").nav_prev()
                end,
                desc = "(Harpoon) previous mark",
            },
            {
                "<leader>m",
                function()
                    require("harpoon.mark").add_file()
                end,
                desc = "(Harpoon) add file",
            },
        },
    },
    {
        "kosayoda/nvim-lightbulb",
        require = "antoinemadec/FixCursorHold.nvim",
        opts = function(opts)
            opts.autocmd = { enabled = true }
        end,
    },
    -- {
    --     "stevearc/oil.nvim",
    --     lazy = false,
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     keys = {
    --         {
    --             "<leader>o",
    --             function()
    --                 vim.cmd("vsplit")
    --                 local win = vim.api.nvim_get_current_win()
    --                 local buf = vim.api.nvim_create_buf(true, true)
    --                 vim.api.nvim_win_set_buf(win, buf)
    --                 require("oil").open()
    --             end,
    --             desc = "[O]pen folder view to the right",
    --         },
    --     },
    --     opts = {
    --         default_file_explorer = false,
    --         view_options = {
    --             show_hidden = true,
    --         },
    --     },
    -- },
    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "comment",
                "cpp",
                "css",
                "csv",
                "diff",
                "dockerfile",
                "ebnf",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "go",
                "gomod",
                "gosum",
                "gotmpl",
                "gowork",
                "gpg",
                "graphql",
                "hcl",
                "helm",
                "html",
                "htmldjango",
                "http",
                "ini",
                "javascript",
                "jq",
                "json",
                "json5",
                "jsonc",
                "jsonnet",
                "lua",
                "luadoc",
                "luap",
                "make",
                "markdown",
                "markdown_inline",
                "proto",
                "pymanifest",
                "python",
                "query",
                "r",
                "regex",
                "requirements",
                "rst",
                "rust",
                "sql",
                "ssh_config",
                "terraform",
                "toml",
                "tsv",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
                "zig",
            },
        },
    },
    { "astral-sh/ruff-lsp" },
    -- add ts_ls and setup with typescript.nvim instead of lspconfig
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
                -- ts_ls will be automatically installed with mason and loaded with lspconfig
                ts_ls = {},
                pyright = {
                    settings = {
                        autoImportCompletion = true,
                        disableOrganiseImports = true,
                        tabWidth = 4,
                    },
                    python = {
                        analysis = {
                            ignore = { "*" },
                        },
                    },
                },
                ruff_lsp = {},
                yamlls = {
                    settings = {
                        yaml = {
                            schemas = {
                                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                                ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                                ["http://json.schemastore.org/semantic-release"] = ".releaserc{,.json}",
                                ["https://json.schemastore.org/jfrog-pipelines.json"] = "{,.}pipelines*.{yml,yaml}",
                                ["https://json.schemastore.org/pre-commit-config.json"] = ".pre-commit-config.{yml,yaml}",
                                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "openapi.{yml,yaml}",
                                ["https://raw.githubusercontent.com/dbt-labs/dbt-jsonschema/main/schemas/dbt_project.json"] = "dbt_project.{yml,yaml}",
                                ["https://raw.githubusercontent.com/dbt-labs/dbt-jsonschema/main/schemas/dbt_yml_files.json"] = "schema.{yml,yaml}",
                                ["https://raw.githubusercontent.com/dbt-labs/dbt-jsonschema/main/schemas/selectors.json"] = "selectors.{yml,yaml}",
                                ["https://raw.githubusercontent.com/dbt-labs/dbt-jsonschema/main/schemas/packages.json"] = "packages.{yml,yaml}",
                                ["https://json.schemastore.org/circleciconfig.json"] = ".circleci/*.{yml,yaml}",
                            },
                        },
                    },
                },
                ["rust_analyzer"] = {
                    settings = {
                        imports = {
                            granularity = {
                                group = "module",
                            },
                            prefix = "self",
                        },
                        cargo = {
                            buildScripts = {
                                enable = true,
                            },
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
                terraformls = {},
                jsonls = {},
                -- suricatals = {
                --     default_config = {
                --         cmd = { "suricata-language-server" },
                --         filetypes = { "suricata", "hog" },
                --         root_dir = function(fname)
                --             return require("lspconfig").util.find_git_ancestor(fname)
                --         end,
                --         single_file_support = true,
                --         settings = {},
                --     },
                -- },
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with typescript.nvim
                ts_ls = function(_, opts)
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
                "actionlint",
                "buf",
                "cfn-lint",
                "colorgen-nvim",
                "commitlint",
                "cpplint",
                "cmakelang",
                "delve",
                "djlint",
                "elm-format",
                "erb-lint",
                "goimports",
                "golangci-lint",
                "golines",
                "hadolint",
                "isort",
                "jq",
                "mypy",
                "markdownlint",
                "prettier",
                "prettierd",
                "protolint",
                "rstcheck",
                -- "rubocop",
                "selene",
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
