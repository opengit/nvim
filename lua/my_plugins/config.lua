return {
	-- --------------------------------------------------------------------------------------------------------------
	{
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup({
				filter_kind = false,
				-- optionally use on_attach to set keymaps when aerial has attached to a buffer
				on_attach = function(bufnr)
					-- Jump forwards/backwards with '{' and '}'
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
			})
		end,
	},
	-- --------------------------------------------------------------------------------------------------------------
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = true, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = false,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
				},
				current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					border = "border",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				}
			})
		end,
	},
	--------------------------------------------------------------------------------------------------------------
	-- codeium
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		config = function()
			-- Change '<C-g>' here to any keycode you like.
			vim.keymap.set("i", "<C-g>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<C-;>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<C-,>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<C-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
			vim.g.codeium_no_map_tab = true
		end,
	},
	-- --------------------------------------------------------------------------------------------------------------
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				cmdline = {
					enabled = true,
					-- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
					-- view = "cmdline_popup",
					view = "cmdline",
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = false, -- position the cmdline and popupmenu together
					long_message_to_split = false, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
			})
		end,
	},
	-- --------------------------------------------------------------------------------------------------------------
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)
			require("ibl").setup({
				indent = { highlight = highlight },
			})
		end,
	},
	-- --------------------------------------------------------------------------------------------------------------
	-- make the use of templates.
	{
		"cvigilv/esqueleto.nvim",
		config = function()
			require("esqueleto").setup({
				patterns = { "python" },
			})
		end,
	},
	-- --------------------------------------------------------------------------------------------------------------
	-- make the use of templates.
	{
		"yutkat/confirm-quit.nvim",
		event = "CmdlineEnter",
		opts = {},
		config = function()
			vim.keymap.set("n", "<leader>q", require("confirm-quit").confirm_quit)
			vim.keymap.set("n", "<leader>Q", require("confirm-quit").confirm_quit_all)
		end,
	},
	-- --------------------------------------------------------------------------------------------------------------
	-- Smart and Powerful commenting plugin for neovim.
	-- Shortcuts: gcc | gbc | [count]gcc | [count]gbc
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		config = function()
			require("Comment").setup()
		end,
	},
	-- --------------------------------------------------------------------------------------------------------------
	-- todo comments
	-- Preview
	-- TODO: todo
	-- FIX: fix
	-- WARNING: warning
	-- HACK: hack
	-- NOTE: note
	-- PERF: perf
	-- TEST: test
	--
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				keywords = {
					FIX = {
						icon = " ", -- icon used for the sign, and in search results
						color = "error", -- can be a hex color, or a named color (see below)
						alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
						-- signs = false, -- configure signs for some keywords individually
					},
					TODO = { icon = " ", color = "todo" },
					HACK = { icon = " ", color = "warning" },
					WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
					PERF = { icon = "󱢍", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					NOTE = { icon = " ", color = "info", alt = { "INFO" } },
					TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
				},
				colors = {
					error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
					warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
					todo = { "DiagnosticOk", "#2563EB" },
					info = { "DiagnosticInfo", "#10B981" },
					default = { "Identifier", "#7C3AED" },
					test = { "Identifier", "#FF00FF" },
				},
			})
		end,
	},
	-- --------------------------------------------------------------------------------------------------------------
	-- guess indent
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},
	-- --------------------------------------------------------------------------------------------------------------
	{ "rafamadriz/friendly-snippets" },
	-- --------------------------------------------------------------------------------------------------------------
	-- auto-tag
	--Use treesitter to autoclose and autorename html tag
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	-- --------------------------------------------------------------------------------------------------------------
	-- CodeStats
	{
		'liljaylj/codestats.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		event = { 'TextChanged', 'InsertEnter' },
		cmd = { 'CodeStatsXpSend', 'CodeStatsProfileUpdate' },
		config = function()
			require('codestats').setup {
				username = 'gitopen',   -- needed to fetch profile data
				base_url = 'https://codestats.net', -- codestats.net base url
				api_key = 'SFMyNTY.WjJsMGIzQmxiZz09IyNNak0xTmpFPQ.xcSenEES1u9OtOokiXKc1O0p_lM-1O-avK5D03y952o',
				send_on_exit = true,    -- send xp on nvim exit
				send_on_timer = true,   -- send xp on timer
				timer_interval = 60000, -- timer interval in milliseconds (minimum 1000ms to prevent DDoSing codestat.net servers)
				curl_timeout = 5,       -- curl request timeout in seconds
			}
		end,
	},
	-- --------------------------------------------------------------------------------------------------------------
	-- Others
}
