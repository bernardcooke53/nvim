return {
  -- customize lsp formatting options
  formatting = {
    -- control auto formatting on save
    format_on_save = {
      enabled = true, -- enable or disable format on save globally
      allow_filetypes = { -- enable format on save for specified filetypes only
        -- "go",
      },
      ignore_filetypes = { -- disable format on save for specified filetypes
        -- "python",
      },
    },
    disabled = { -- disable formatting capabilities for the listed language servers
      -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
      -- "lua_ls",
    },
    timeout_ms = 1000, -- default format timeout
    -- filter = function(client) -- fully override the default formatting function
    --   return true
    -- end
  },
  -- enable servers that you already have installed without mason
  servers = {
    -- "pyright"
  },
  config = {
    -- example for addings schemas to yamlls
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
          },
        },
      },
    },
    pylsp = {
      settings = {
        pylsp = {
          plugins = {
            autopep8 = { enabled = false },
            yapf = { enabled = false },
            pylsp_mypy = { enabled = true },
            pyls_isort = { enabled = true },
            flake8 = { enabled = true },
            pylint = { enabled = false },
            pyflakes = { enabled = true },
            pycodestyle = { enabled = false },
            black = { enabled = true },
            ruff = { enabled = true },
          },
          tab_width = 4,
        },
      },
    },
    pyright = {
      settings = {
        tab_width = 4,
      },
    },
    sumneko_lua = {
      settings = {
        tab_width = 4,
      },
    },
    ["rust-analyzer"] = {
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
    ruff_lsp = {
      settings = {
        args = {},
      },
    },
  },
}
