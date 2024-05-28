vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim.o.clipboard = 'unnamed'

vim.o.nu = true
vim.o.relativenumber = true


vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true

vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.scrolloff = 8
vim.o.signcolumn = 'yes'
vim.o.colorcolumn = "80"

vim.o.updatetime = 300

vim.o.termguicolors = true

vim.o.mouse = 'a'

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_keepdir = 0
vim.g.netrw_list_hide = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+"
vim.g.netrw_localcopycmd = 'cp -r'

-- 42_header
vim.g.user42 = 'kgriset'
vim.g.mail42 = 'kgriset@student.42.fr'
