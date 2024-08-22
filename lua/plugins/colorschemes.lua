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
		"luisiacc/gruvbox-baby",
		priority = 1000,
		config = function()
			-- vim.g.gruvbox_baby_background_color = "dark"
			-- vim.g.gruvbox_baby_background_color = "medium"
			-- vim.cmd [[colorscheme gruvbox-baby]]
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				integrations = {
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = true,
					coc_nvim = true,
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})
			-- latte, frappe, macchiato, mocha
			vim.g.catppuccin_flavour = "mocha"
			vim.cmd.colorscheme "catppuccin"
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- -----------------------------------------
			-- dark
			-- vim.cmd [[colorscheme tokyonight]]
			-- vim.cmd [[colorscheme tokyonight-night]]
			-- vim.cmd [[colorscheme tokyonight-storm]]
			-- vim.cmd [[colorscheme tokyonight-moon]]
			-- -----------------------------------------
			-- light
			-- vim.o.background = "light"
			-- vim.cmd [[colorscheme tokyonight-day]]
		end,
	}
}
