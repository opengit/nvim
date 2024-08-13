return {
	{
		"hardhackerlabs/theme-vim",
		name = "hardhacker",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.hardhacker_darker = 1
			vim.g.hardhacker_hide_tilde = 1
			vim.g.hardhacker_keyword_italic = 1
			vim.cmd("colorscheme hardhacker")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- require("tokyonight").setup({
			-- 	-- storm, night, moon, day
			-- 	style = "night",
			-- 	light_style = "day",
			-- 	terminal_colors = true,
			-- 	-- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			-- 	day_brightness = 0.3,
			-- 	-- When `true`, section headers in the lualine theme will be bold
			-- 	lualine_bold = true,
			-- })
			-- vim.o.background = "dark"
			-- vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			-- require("gruvbox").setup({
			-- 	-- can be "hard", "soft" or empty string
			-- 	contrast = "soft",
			-- })
			-- or "light" for light mode
			-- vim.o.background = "light"
			-- vim.cmd("colorscheme gruvbox")
		end,
	},
	{
		"luisiacc/gruvbox-baby",
		priority = 1000,
		config = function()
			-- vim.g.gruvbox_baby_background_color = "dark"
			-- vim.g.gruvbox_baby_background_color = "medium"
			-- vim.cmd[[colorscheme gruvbox-baby]]
		end,
	},
	{
		{
			"neanias/everforest-nvim",
			priority = 1000,
			config = function()
				-- require("everforest").setup({
				-- 	-- hard, medium, soft
				-- 	everforest_background = "hard",
				-- 	everforest_better_performance = 1,
				-- })
				-- vim.o.background = "dark"
				-- vim.cmd([[colorscheme everforest]])
			end,
		},
	},
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
		config = function()
			-- onedark, onelight, onedark_vivid, onedark_dark
			-- vim.cmd("colorscheme onedark_dark")
			-- vim.cmd("colorscheme onedark_vivid")
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		priority = 1000,
		config = function()
			-- require("dracula").setup({})
			-- vim.o.background = "dark"
			-- vim.cmd([[colorscheme dracula]])
			-- vim.cmd[[colorscheme dracula-soft]]
		end,
	},
	{
		"tanvirtin/monokai.nvim",
		priority = 1000,
		config = function()
			-- 	require("monokai").setup({
			-- 		-- soda, pro, ristretto
			-- 		palette = require("monokai").soda,
			-- 	})
		end,
	},
	{
		'f4z3r/gruvbox-material.nvim',
		name = 'gruvbox-material',
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- require("gruvbox-material").setup({
			-- 	-- set contrast, can be any of "hard", "medium", "soft"
			-- 	contrast = "soft",
			-- })
			-- -- "dark" or "light"
			-- -- vim.o.background = "light"
			-- vim.o.background = "dark"
		end,
	},
}
