local opt = vim.opt

-- Fixes
opt.backspace     = "eol,start,indent"

-- Files
opt.swapfile      = true
opt.dir           = '/tmp'
opt.hidden        = true

-- Search
opt.hlsearch      = true
opt.incsearch     = true
opt.ignorecase    = true
opt.smartcase     = true

--Editing
opt.showmatch     = true
opt.mat           = 2
opt.scrolloff     = 12
opt.history       = 500
opt.timeoutlen    = 500
opt.foldcolumn    = "2"
opt.autoread      = true
opt.lazyredraw    = true
opt.magic         = true
opt.clipboard     = 'unnamedplus'
opt.number        = true
opt.completeopt   = 'menuone,noinsert,noselect'
opt.splitbelow    = true
opt.splitright    = true
opt.termguicolors = true
opt.background    = 'dark'
opt.wildmode      = "full"
opt.wildmenu      = true
opt.undofile      = true
opt.list           = true
opt.number         = true
opt.relativenumber = true
opt.wrap           = false

-- Indent
opt.shiftwidth     = 2
opt.tabstop        = 2
opt.expandtab      = true
opt.smarttab       = true
opt.autoindent     = true
opt.smartindent    = true
opt.wrap           = true

opt.switchbuf       = "useopen,usetab,newtab"

