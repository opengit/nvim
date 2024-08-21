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
			vim.cmd("colorscheme hardhacker")
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
}
