return {
	-- Syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				indent = {
					enable = true,
				},
				ensure_installed = { "markdown", "markdown_inline", "regex", "python", "lua", "vim", "javascript" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					-- disable = {},
					disable = function(lang, buf)
						-- local max_filesize = 100 * 1024 -- 100 KB
						local max_filesize = 2000 * 1024 -- 2000 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
					additional_vim_regex_highlighting = false,
				},
			})

			-- let it to use 'markdown' parser for mdx filetype.
			vim.treesitter.language.register("markdown", "mdx")
		end,
	},

	-- Colors highlighting
	{
		"NvChad/nvim-colorizer.lua",
		config = function(plun)
			require("colorizer").setup({
				user_default_options = {
					names = true,
				},
			})
		end,
	},
}
