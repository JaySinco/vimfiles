local opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, silent = true, expr = true }

vim.api.nvim_set_keymap('n', '<C-Left>', ':BufferLineCyclePrev<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-Right>', ':BufferLineCycleNext<CR>', opts)

vim.api.nvim_set_keymap('n', '<leader>p', ':GFiles<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>g', ':Neogit<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>x', ':bp <BAR> bd #<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>Gitsigns preview_hunk<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>e', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>c', '<Plug>NERDCommenterToggle', opts)
vim.api.nvim_set_keymap('v', '<leader>c', '<Plug>NERDCommenterToggle<CR>gv', opts)

vim.keymap.set('n', '<space>a', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>l', vim.diagnostic.setloclist, opts)

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', 'gc', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

vim.api.nvim_set_keymap('n', '""', ':registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>', opts)

-- imap('<TAB>', [[pumvisible() ? "\<C-n>" : CheckBackspace() ? "\<TAB>" : coc#refresh()]], true)
