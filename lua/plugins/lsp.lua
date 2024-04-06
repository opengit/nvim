return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
					border = "rounded",
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({})
				end,
				-- Next, you can provide a dedicated handler for specific servers.
				-- For example, a handler override for the `rust_analyzer`:
				-- ["rust_analyzer"] = function ()
				--     require("rust-tools").setup {}
				-- end
			})
			-- To instead override globally
			-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			-- 	opts = opts or {}
			-- 	opts.border = opts.border or border
			-- 	return orig_util_open_floating_preview(contents, syntax, opts, ...)
			-- end
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			format = {
				timeout_ms = 3000,
			},
		},
		config = function()
			require("plugins/lspconfig/config")()
		end,
	},

	{
		-- "jose-elias-alvarez/null-ls.nvim",
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				border = "none",
				cmd = { "nvim" },
				debounce = 250,
				debug = false,
				default_timeout = 5000,
				diagnostic_config = {},
				diagnostics_format = "#{m}",
				fallback_severity = vim.diagnostic.severity.ERROR,
				log_level = "warn",
				notify_format = "[null-ls] %s",
				on_init = nil,
				on_exit = nil,
				root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
				should_attach = nil,
				sources = nil,
				temp_dir = nil,
				update_in_insert = false,
				-- formatting on save
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			}) -- end of setup
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			-- "jose-elias-alvarez/null-ls.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			require("mason-null-ls").setup({
				automatic_setup = true,
				-- ensure_installed = { "shfmt", "prettier", "stylua", "black", "isort", "flake8" },
				-- ensure_installed = { "shfmt", "stylua" },
				ensure_installed = {
					"shfmt",
					"prettier",
					"typescript-language-server",
					"ruff-lsp",
					"jedi-language-server",
					"stylua",
				},
				handlers = {
					-- flake8 = function(source_name, methods)
					-- 	null_ls.register(null_ls.builtins.diagnostics.flake8.with({
					-- 		extra_args = { "--max-line-length", "88" },
					-- 	}))
					-- end,
					-- prettier = function(source_name, methods)
					-- 	null_ls.register(null_ls.builtins.formatting.prettier.with({
					-- 		extra_args = { "--tab-width", "4" },
					-- 	}))
					-- end,
					prettier = function(source_name, methods)
						null_ls.register(null_ls.builtins.formatting.prettier.with({
							filetypes = {
								"javascript",
								"javascriptreact",
								"typescript",
								"typescriptreact",
								"vue",
								"css",
								"scss",
								"html",
								"json",
								"yaml",
								"markdown",
								"graphql",
								"md",
								"txt",
							},
							extra_args = { "--tab-width", "4" },
							-- extra_args = function(params)
							-- 	return params.options
							-- 		and params.options.tabSize
							-- 		and {
							-- 			"--tab-width",
							-- 			"4",
							-- 			-- params.options.tabSize,
							-- 		}
							-- end,
						}))
					end,
				},
			})
		end,
	},
}
