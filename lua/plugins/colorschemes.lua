return {
	{
		"hardhackerlabs/theme-vim",
		name = "hardhacker",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.g.hardhacker_darker = 1
			-- vim.g.hardhacker_hide_tilde = 1
			-- vim.g.hardhacker_keyword_italic = 1
			-- vim.cmd("colorscheme hardhacker")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			-- require("gruvbox").setup({
			-- 	-- invert background for search, diffs, statuslines and errors
			-- 	inverse = true,
			-- 	-- can be "hard", "soft" or empty string
			-- 	contrast = "soft",
			-- })
			-- vim.cmd("colorscheme gruvbox")
		end,
	},
	{
		'sainnhe/gruvbox-material',
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.g.gruvbox_material_enable_italic = true
			-- vim.g.gruvbox_material_better_performance = 1
			-- 'hard', 'medium', 'soft'
			-- vim.g.gruvbox_material_background = 'medium'
			-- -- material, mix, original
			-- vim.g.gruvbox_material_foreground = 'material'
			-- vim.cmd.colorscheme('gruvbox-material')
		end
	},
	{
		'Mofiqul/dracula.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd [[colorscheme dracula]]
			-- vim.cmd [[colorscheme dracula-soft]]
		end
	},
	{
		'navarasu/onedark.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			-- require('onedark').setup {
			-- 	-- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
			-- 	style = 'dark'
			-- }
			-- require('onedark').load()
		end
	},
	-- Lazy
	{
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- onedark, onelight, onedark_vivid, onedark_dark
			vim.cmd("colorscheme onedark_dark")
		end
	}

}
