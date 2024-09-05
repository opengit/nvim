return function()
	local bufferline = require("bufferline")
	bufferline.setup({
		options = {
			mode = "buffers",                      -- set to "tabs" to only show tabpages instead
			style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
			-- style_preset = bufferline.style_preset.minimal,
			themable = true,                       -- allows highlight groups to be overriden i.e. sets highlights as default
			-- numbers = function(opts)
			-- 	return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
			-- end,
			-- indicator = {
			-- 	icon = "▎", -- this should be omitted if indicator style is not 'icon'
			-- 	style = "icon",
			-- },
			-- diagnostics = "coc",
			-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
			-- 	local icon = level:match("error") and " " or " "
			-- 	return " " .. icon .. count
			-- end,
			offsets = {
				{
					filetype = "neo-tree",
					text = "📁 File Explorer",
					text_align = "left",
					separator = true,
				},
			},
			color_icons = true, -- whether or not to add the filetype icon highlights
			-- thick, thin, thick, slope, slant
			-- separator_style = "thick",
			hover = {
				enabled = true,
				delay = 100,
				reveal = { "close" },
			},
		},
	})
end
