HOME = os.getenv("HOME")

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.updatetime = 200

-- Basic settings
vim.opt.encoding = "utf-8"
vim.opt.backspace = "indent,eol,start" -- backspace works on every char in insert mode
vim.opt.completeopt = "menuone,noselect"
vim.opt.history = 1000
vim.opt.startofline = true
vim.opt.confirm = true

-- Mapping waiting time
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100

-- Display
vim.opt.scrolloff = 3
vim.opt.showmatch = true
vim.opt.synmaxcol = 300
vim.opt.laststatus = 3
-- vim.o.guifont = "GoMono Nerd Font:h10:#Bold"
-- vim.o.guifont = "BlexMono Nerd Font Mono:h10"
if vim.loop.os_uname().sysname == "OSX" then
	vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h10"
else
	vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h8"
end
vim.opt.ttyfast = true -- faster redrawing
vim.opt.linespace = 0

vim.opt.list = false -- do not display white characters
vim.opt.listchars = {
	tab = "→ ",
	eol = "↲",
	trail = "⋅",
	extends = "❯",
	precedes = "❮",
}

vim.opt.foldmethod = "indent" -- use language syntax to generate folds
-- vim.cmd([[set foldmethod=expr]]) -- use treesitter folding support
-- vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
vim.opt.foldenable = false -- don't fold by default
vim.opt.foldlevel = 1 -- limit folding to 4 levels
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 10 -- 10 nested fold max
vim.opt.wrap = false --do not wrap lines even if very long
vim.opt.eol = false -- show if there's no eol char
-- vim.opt.showbreak = "↪" -- character to show when line is broken
vim.opt.showbreak = "↪ " -- character to show when line is broken

-- Sidebar
vim.opt.number = true -- line number on the left
vim.opt.numberwidth = 3 -- always reserve 3 spaces for line number
vim.opt.signcolumn = "yes" -- keep 1 column for coc.vim  check
vim.opt.modelines = 0
vim.opt.showcmd = false -- display command in bottom bar

-- Search
vim.opt.incsearch = true -- starts searching as soon as typing, without enter needed
vim.opt.ignorecase = true -- ignore letter case when searching
vim.opt.smartcase = true -- case insentive unless capitals used in search

vim.opt.matchtime = 2 -- delay before showing matching paren
vim.opt.mps = vim.o.mps .. ",<:>"

-- White characters
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 -- indentation rule
-- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
vim.opt.formatoptions = "qnj1"
vim.opt.expandtab = true -- expand tab to spaces

-- Backup files
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.undofile = true
vim.opt.swapfile = false
-- vim.opt.updatecount = 0 -- don't write swap files after some number of updates
vim.opt.updatecount = 1000

local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")
vim.opt.undodir = { prefix .. "/nvim/.undo//" }
vim.opt.backupdir = { prefix .. "/nvim/.backup//" }
vim.opt.directory = { prefix .. "/nvim/.swp//" }

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

-- Commands mode
vim.opt.wildmenu = true -- on TAB, complete options for system command
vim.opt.wildignore =
	"deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc"

-- Only show cursorline in the current window and in normal mode.
vim.cmd([[
  augroup cline
      au!
      au WinLeave * set nocursorline
      au WinEnter * set cursorline
      au InsertEnter * set nocursorline
      au InsertLeave * set cursorline
  augroup END
]])

vim.cmd([[
    set noeb
    set t_Co=256
    filetype    plugin indent on
    exec        "nohlsearch"
    syntax      enable
    syntax      on
]])

-- neovide
if vim.g.neovide then

	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0

	vim.g.neovide_confirm_quit = true
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_theme = "auto"
	vim.g.neovide_unlink_border_highlights = false

	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_refresh_rate_idle = 30

	vim.g.neovide_scroll_animation_length = 0.1
	vim.g.neovide_scroll_animation_far_lines = 1

	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_trail_size = 0.2
	vim.g.neovide_cursor_antialiasing = true

	vim.g.neovide_cursor_animate_in_insert_mode = true
	vim.g.neovide_cursor_animate_command_line = true

	-- vim.g.neovide_cursor_vfx_mode = "pixiedust"
	vim.g.neovide_cursor_vfx_mode = "ripple"
	vim.g.neovide_cursor_vfx_particle_lifetime = 1.1
	vim.g.neovide_cursor_vfx_particle_speed = 12.0
end
