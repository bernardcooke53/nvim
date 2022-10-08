local config = {

	-- Configure AstroNvim updates
	updater = {
		remote = "origin", -- remote to use
		channel = "nightly", -- "stable" or "nightly"
		version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "main", -- branch name (NIGHTLY ONLY)
		commit = nil, -- commit hash (NIGHTLY ONLY)
		pin_plugins = true, -- true, false, or a string for a specific AstroNvim snapshot to use (true will only track the current version if channel is "stable")
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		-- remotes = { -- easily add new remotes to track
		--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
		--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
		--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		-- },
	},

	-- Set colorscheme
	-- colorscheme = "default_theme",

	-- set vim options here (vim.<first_key>.<second_key> =  value)
	options = {
		opt = {
			relativenumber = true, -- sets vim.opt.relativenumber
		},
		g = {
			mapleader = " ", -- sets vim.g.mapleader
		},
	},

	-- Default theme configuration
	--colorscheme = "default_theme",
	colorscheme = "duskfox",

	highlights = {
		-- Modify the color table
		colors = {
			fg = "#abb2bf",
		},
		-- Modify the highlight groups
		highlights = function(highlights)
			local C = require("default_theme.colors")
			C.fg = "#abb2bf"

			highlights.DiagnosticError.italic = true
			highlights.DiagnosticError.italic = true
			highlights.DiagnosticHint.italic = true
			highlights.DiagnosticInfo.italic = true
			highlights.DiagnosticWarn.italic = true

			highlights.Normal = { fg = C.fg, bg = C.bg }
			return highlights
		end,
	},
	default_theme = {
		colors = {
			fg = "#abb2bf",
		},
		plugins = { -- enable or disable extra plugin highlighting
			aerial = true,
			beacon = false,
			bufferline = true,
			dashboard = true,
			highlighturl = true,
			hop = false,
			indent_blankline = true,
			lightspeed = false,
			["neo-tree"] = true,
			notify = true,
			["nvim-tree"] = false,
			["nvim-web-devicons"] = true,
			rainbow = true,
			symbols_outline = false,
			telescope = true,
			vimwiki = false,
			["which-key"] = true,
		},
	},
	duskfox = {
		colors = {
			fg = "#abb2bf",
		},
		plugins = { -- enable or disable extra plugin highlighting
			aerial = true,
			beacon = false,
			bufferline = true,
			dashboard = true,
			highlighturl = true,
			hop = false,
			indent_blankline = true,
			lightspeed = false,
			["neo-tree"] = true,
			notify = true,
			["nvim-tree"] = false,
			["nvim-web-devicons"] = true,
			rainbow = true,
			symbols_outline = false,
			telescope = true,
			vimwiki = false,
			["which-key"] = true,
		},
	},

	-- Configure plugins
	plugins = {
		-- Add plugins, the packer syntax without the "use"
		init = {
			-- You can disable default plugins as follows:
			-- ["goolord/alpha-nvim"] = { disable = true },

			-- You can also add new plugins here as well:
			-- { "andweeb/presence.nvim" },
			-- {
			--   "ray-x/lsp_signature.nvim",
			--   event = "BufRead",
			--   config = function()
			--     require("lsp_signature").setup()
			--   end,
			-- },
			{ "svermeulen/vim-cutlass" },
			{ "psf/black" },
			{ "junegunn/fzf.vim" },
		},
		-- All other entries override the setup() call for default plugins
		["null-ls"] = function(config)
			local null_ls = require("null-ls")
			-- Check supported formatters and linters
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
			config.sources = {
				-- Set a formatter
				null_ls.builtins.formatting.rufo,
				-- Set a linter
				null_ls.builtins.diagnostics.rubocop,
			}
			-- set up null-ls's on_attach function
			config.on_attach = function(client)
				-- NOTE: You can remove this on attach function to disable format on save
				if client.server_capabilities.document_formatting then
					vim.api.nvim_create_autocmd("BufWritePre", {
						desc = "Auto format before save",
						pattern = "<buffer>",
						callback = vim.lsp.buf.format,
					})
				end
			end
			return config -- return final config table
		end,
		["neo-tree"] = {
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
				},
			},
		},
		treesitter = {
			ensure_installed = { "lua" },
		},
		["nvim-lsp-installer"] = {
			ensure_installed = { "sumneko_lua" },
		},
		packer = {
			compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
		},
		telescope = {
			defaults = {
				file_ignore_patterns = { ".git", "node_modules", "lib/python", "Lib/python" },
			},
		},
		--nerdtree = function(config)
		--  vim.g.NERDTreeShowHidden = 1
		--  return config
		--end,
	},

	-- LuaSnip Options
	luasnip = {
		-- Add paths for including more VS Code style snippets in luasnip
		vscode_snippet_paths = {},
		-- Extend filetypes
		filetype_extend = {
			javascript = { "javascriptreact" },
		},
	},

	-- Modify which-key registration
	["which-key"] = {
		-- Add bindings
		register = {
			-- first key is the mode, n == normal mode
			n = {
				-- second key is the prefix, <leader> prefixes
				["<leader>"] = {
					-- which-key registration table for normal mode, leader prefix
					-- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
					["b"] = { ":b#<cr>", "Previous buffer" },
				},
			},
		},
	},

	-- CMP Source Priorities
	-- modify here the priorities of default cmp sources
	-- higher value == higher priority
	-- The value can also be set to a boolean for disabling default sources:
	-- false == disabled
	-- true == 1000
	cmp = {
		source_priority = {
			nvim_lsp = 1000,
			luasnip = 750,
			buffer = 500,
			path = 250,
		},
	},

	-- Extend LSP configuration
	lsp = {
		-- enable servers that you already have installed without lsp-installer
		servers = {
			-- "pyright"
		},
		formatting = {
			format_on_save = true,
		},
		filter = function(client)
			return true
		end,
		-- add to the server on_attach function
		-- on_attach = function(client, bufnr)
		-- end,

		-- override the lsp installer server-registration function
		-- server_registration = function(server, opts)
		--   require("lspconfig")[server].setup(opts)
		-- end,

		-- Add overrides for LSP server settings, the keys are the name of the server
		["server-settings"] = {
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
						},
					},
				},
			},
			pylsp = {
				settings = {
					pylsp = {
						plugins = {
							pylsp_mypy = { enabled = true },
							pyls_isort = { enabled = true },
							flake8 = { enabled = true },
							pylint = { enabled = false },
							pyflakes = { enabled = true },
							pycodestyle = { enabled = false },
							black = { enabled = true },
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
		},
	},

	-- Diagnostics configuration (for vim.diagnostics.config({}))
	diagnostics = {
		virtual_text = true,
		underline = true,
	},

	-- This function is run last
	-- good place to configure mappings and vim options
	polish = function()
		-- Set key bindings
		vim.keymap.set("n", "<C-s>", ":w!<CR>")

		-- Set autocommands
		vim.api.nvim_create_augroup("packer_conf", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			desc = "Sync packer after modifying plugins.lua",
			group = "packer_conf",
			pattern = "plugins.lua",
			command = "source <afile> | PackerSync",
		})

		-- Keymaps - set using vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {options})
		vim.keymap.set("n", "<c-s>", ":w<CR>", {})
		vim.keymap.set("i", "<c-s>", "<Esc>:w<CR>a", {})

		local opts = { noremap = true }

		-- Set m key for cutting text - https://github.com/svermeulen/vim-cutlass
		vim.keymap.set("n", "m", "d", opts)
		vim.keymap.set("n", "mm", "dd", opts)
		vim.keymap.set("x", "m", "d", opts)
		vim.keymap.set("x", "mm", "dd", opts)
		-- Set up custom filetypes
		-- vim.filetype.add {
		--   extension = {
		--     foo = "fooscript",
		--   },
		--   filename = {
		--     ["Foofile"] = "fooscript",
		--   },
		--   pattern = {
		--     ["~/%.config/foo/.*"] = "fooscript",
		--   },
		-- }
	end,
}

return config
