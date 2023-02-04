local opt = vim.opt

-- UI
opt.laststatus    = 3  -- global status line

-- Files
opt.swapfile      = true
opt.dir           = '/tmp'
opt.hidden        = true

-- Search
opt.hlsearch      = false
opt.incsearch     = true
opt.ignorecase    = true
opt.smartcase     = true
opt.inccommand    = 'split'

opt.mouse         = 'a'

--Editing
opt.showmatch     = true
opt.mat           = 2
opt.scrolloff     = 12
opt.history       = 500
opt.timeoutlen    = 500
opt.autoread      = true
opt.lazyredraw    = true
opt.magic         = true
opt.clipboard     = 'unnamedplus'
opt.completeopt   = 'menu,menuone,noselect'
opt.background    = 'dark'
opt.wildmode      = "longest:full,full"
opt.wildmenu      = true
opt.undofile      = true
opt.list          = true
opt.shiftround    = true -- Round indent
opt.shiftwidth    = 2 -- Size of an indent

opt.spelllang     = { "en" }
opt.splitbelow    = true -- Put new windows below current
opt.splitright    = true -- Put new windows right of current
opt.tabstop       = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen    = 300
opt.undofile      = true
opt.undolevels    = 10000
opt.updatetime    = 200 -- Save swap file and trigger CursorHold

-- Margin
opt.foldcolumn     = "2"
opt.number         = true
opt.relativenumber = false
opt.wrap           = false
opt.signcolumn     = 'yes'

-- Indent
opt.expandtab      = true
opt.smarttab       = true
opt.autoindent     = true
opt.smartindent    = true

opt.switchbuf      = "useopen"
opt.guifont        = "FiraCode Nerd Font"
