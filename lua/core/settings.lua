local o = vim.o

-- enable filetype
vim.api.nvim_command("filetype plugin indent on")

-- remove banner for netrw
vim.g.netrw_banner = 0
-- display relative line numbers in netrw
vim.g.netrw_bufsettings = "nu rnu"

-- status line
-- o.statusline = "%<%f %m%r%=%y%-14.( %l/%L | %c%) %P"

-- enable true colors
o.termguicolors = true

-- automatically turn on relative line numbers
o.number = true
o.relativenumber = true

-- show line on current row
o.cursorline = true

-- better buffer splitting
o.splitright = true
o.splitbelow = true

-- remember 500 items in commandline history
o.history = 500

-- do not save when switching buffers
o.hidden = true

-- hides the --INSERT under bar
o.showmode = false

-- decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- set 7 lines to the cursor - when moving vertically using j/k
o.scrolloff = 7

-- 1 tab == 4 spaces
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
-- take indent from previous line to new line
o.autoindent = true
o.smartindent = true
-- use spaces instead of tabs
o.expandtab = true
o.smarttab = true

-- linebreak on 300 characters
o.textwidth = 300

-- ignore case when searching except when using capitals
o.ignorecase = true
o.smartcase = true

-- show dots for trailing spaces
o.list = true
o.listchars = "trail:·,nbsp:◇,tab:| ,extends:▸,precedes:◂"

-- wrap between next and previous lines when at the beginning/end of a line
o.whichwrap = "<>[]hl,b,s"

-- do not wrap lines
o.wrap = false

-- keep list of undo history
o.undofile = true

-- makes neovim and host os clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- Undo and backup options
o.backup = false
o.writebackup = false
o.swapfile = false
