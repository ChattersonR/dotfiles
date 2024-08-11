vim.opt.listchars = { tab=">-", trail="~", extends=">", precedes="<" }
vim.opt.list = true
--vim.opt.nocompatible = true       -- disable compatibility to old-time vi
vim.opt.showmatch = true            -- show matching 
vim.opt.ignorecase = true           -- case insensitive 
vim.opt.mouse="v"                   -- middle-click paste with 
vim.opt.hlsearch = true             -- highlight search 
vim.opt.incsearch = true            -- incremental search
vim.opt.tabstop=4                   -- number of columns occupied by a tab 
vim.opt.softtabstop=4               -- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true            -- converts tabs to white space
vim.opt.shiftwidth=4                -- width for autoindents
vim.opt.autoindent = true           -- indent a new line the same amount as the line just typed
vim.opt.number = true               -- add line numbers
vim.opt.wildmode="longest,list"     -- get bash-like tab completions
vim.opt.cc="80"                     -- set an 80 column border for good coding style
vim.opt.clipboard="unnamedplus"     -- using system clipboard
vim.opt.cursorline = true           -- highlight current cursorline
vim.opt.ttyfast = true              -- Speed up scrolling in Vim

