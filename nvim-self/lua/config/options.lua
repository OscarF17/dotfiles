-- Display line numbers on the left side of the screen
vim.opt.number = true

-- Show the line number relative to the line your cursor is on
vim.opt.relativenumber = true

-- Use spaces instead of actual tab characters when you press Tab
vim.opt.expandtab = true

-- The number of spaces a Tab character represents
vim.opt.tabstop = 4

-- The number of spaces used for each level of automatic indentation
vim.opt.shiftwidth = 4

-- Highlight the search results as you type your search query
vim.opt.incsearch = true

-- Keep search results highlighted after you press enter
vim.opt.hlsearch = true

-- Ignore case when searching
vim.opt.ignorecase = true

-- If the search contains a capital letter, it becomes case-sensitive
vim.opt.smartcase = true

-- Enable mouse support for clicking and scrolling
vim.opt.mouse = "a"

-- Wrap long lines of text to the next line visually
vim.opt.wrap = true 

-- Copy commands also copy to system clipboard
vim.opt.clipboard = "unnamedplus"
