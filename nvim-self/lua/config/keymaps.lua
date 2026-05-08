-- Moving keymaps to the lazy.lua file can improve performance as creating keymaps for plugins forces LazyNvim to load them on startup. If a keymap isn't here, check there.

local keymap = vim.keymap.set

keymap("n", "<leader>q", "<cmd>Neotree close<CR><cmd>confirm q<CR>", { desc = "Close window" })

-- Move between windows using Ctrl + hjkl
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Neotree
keymap("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle File Explorer" })
keymap("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus File Explorer" })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set("n", "<leader>th", "<cmd>Telescope colorscheme enable_preview=true<cr>", { desc = "Switch Themes" })

-- Lazygit
vim.keymap.set("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { desc = "Toggle LazyGit" })

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ 
  cmd = "lazygit", 
  hidden = true, 
  direction = "float" 
})

function _lazygit_toggle()
  lazygit:toggle()
end
