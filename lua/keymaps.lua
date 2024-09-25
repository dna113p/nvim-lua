-- [[ Basic Keymaps ]]
vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

vim.keymap.set('i', '<C-]>', '<Esc>:w<Cr>' )

-- [[ Custom Mappings ]]
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set({ 'n', 'v' }, ';', ':')
vim.keymap.set({ 'n', 'v' }, ':', ';')

-- Repeat last macro with Q
vim.keymap.set('n', 'Q', '@@')

-- Delete backwards in insert mode with C + Backspace
vim.keymap.set('i', '<C-h>', '<C-w>')

-- Swap to last buffer
vim.keymap.set('n', '<leader>,', ':e#<CR>', {silent = true})

-- Swap to previous/next buffer
vim.keymap.set('n', '<leader>n', ':bnext<cr>')
vim.keymap.set('n', '<leader>p', ':bprevious<cr>')

-- Split window navigation 
vim.keymap.set('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.keymap.set('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.keymap.set('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
vim.keymap.set('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

vim.keymap.set('n', '<leader>/', vim.cmd.nohlsearch)
-- [[ Basic Keymaps ]]
vim.g.mapleader = ','
vim.g.maplocalleader = '\\'
vim.keymap.set('i', '<C-]>', '<Esc>:w<Cr>' )

-- [[ Custom Mappings ]]
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set({ 'n', 'v' }, ';', ':')
vim.keymap.set({ 'n', 'v' }, ':', ';')

-- Repeat last macro with Q
vim.keymap.set('n', 'Q', '@@')

-- Delete backwards in insert mode with C + Backspace
vim.keymap.set('i', '<C-h>', '<C-w>')

-- Swap to last buffer
vim.keymap.set('n', '<leader>,', ':e#<CR>', {silent = true})

-- Swap to previous/next buffer
vim.keymap.set('n', '<leader>n', ':bnext<cr>')
vim.keymap.set('n', '<leader>p', ':bprevious<cr>')

-- Split window navigation 
vim.keymap.set('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.keymap.set('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.keymap.set('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
vim.keymap.set('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

vim.keymap.set('n', '<leader>/', vim.cmd.nohlsearch)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Move selected lines up or down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Yank to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p')

