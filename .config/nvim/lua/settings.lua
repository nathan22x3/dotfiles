-- global
vim.g.mapleader = ' '
vim.g.coc_global_extensions = {
  'coc-css',
  'coc-eslint',
  'coc-git',
  'coc-html',
  'coc-json',
  'coc-markdownlint',
  'coc-prettier',
  'coc-rust-analyzer',
  'coc-sumneko-lua',
  'coc-tsserver',
}

-- basic settings
local cmd = vim.cmd
local opt = vim.opt

cmd('syntax enable')
opt.encoding = 'utf-8'
opt.clipboard = 'unnamedplus'
opt.backspace = 'indent,eol,start'
opt.completeopt = 'menuone,noinsert,noselect'
opt.mouse = 'a' -- enables mouse support for all modes
opt.startofline = true
opt.spell = true
opt.spelllang = 'en_us'

-- color scheme
opt.termguicolors = true
opt.winblend = 0
opt.background = 'dark'
cmd('colorscheme gruvbox')
cmd('highlight Normal guibg=NONE ctermbg=NONE')
cmd('highlight WinSeparator guibg=NONE')

-- display
opt.lazyredraw = true -- for better performance while	executing macros
opt.synmaxcol = 300 -- stop syntax highlight after number of lines for performance

opt.showmode = false
opt.laststatus = 3 -- always show status line of the last window
opt.scrolloff = 10 -- keep above and below the cursor number of lines

opt.foldenable = false
opt.foldlevel = 4 -- limit folding to 4 levels
opt.foldmethod = 'syntax' -- use language syntax to generate folds

opt.cursorline = true -- highlight the text line of the cursor
opt.eol = false -- show if there is no eol char
opt.linebreak = true
opt.list = false -- do not display white space characters
opt.showbreak= '↪' -- character to show when line is broken
opt.showmatch  = true -- show matching brackets
opt.textwidth = 0 -- maximum width of text that is being inserted
opt.wrap = true -- wrap long line

-- sidebar
opt.number = true -- show line number
opt.relativenumber = true -- displayed number to be	relative to the cursor
opt.signcolumn = 'yes' -- always show the sign column

-- tabs
opt.autoindent = true -- copy indent from current line when starting a new line
opt.smartindent = true -- do smart auto indenting when starting a new line
opt.expandtab = true -- expand tab to spaces
opt.tabstop = 2 -- number of spaces that a <Tab> in the file counts for
opt.softtabstop = 2 -- number of spaces that a <Tab> counts for while performing editing operations
opt.shiftwidth = 2 -- number of spaces to use for each step of (auto)indent

-- window
opt.splitright = true -- focus to the new window when splitting horizontal
opt.splitbelow = true -- focus to the new window when splitting vertical

-- searching
opt.incsearch = true -- starts searching as soon as typing, without enter needed
opt.ignorecase = true -- case insensitive searching
opt.smartcase = true -- case insensitive unless capitals used in search

-- backup
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- misc
table.insert(opt.shortmess, 'c')
table.insert(opt.path, '**') -- list of directories will lookup when using search commands
table.insert(opt.wildignore, '*/node_modules/*') -- list of directories will ignore when using search commands
