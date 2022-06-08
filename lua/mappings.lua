local opts = { noremap = true, silent = true }
-- local expr_opts = { noremap = true, silent = true, expr = true }

vim.keymap.set('n', '""', ':registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>', opts)

vim.keymap.set('n', '<C-Left>', ':BufferLineCyclePrev<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':BufferLineCycleNext<CR>', opts)
vim.keymap.set('n', '<C-p>', ':GFiles<CR>', opts)
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<C-`>', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', opts)
vim.keymap.set('t', '<C-`>', [[<C-\><C-n>]], opts)

vim.keymap.set('n', '<leader>x', ':bp <BAR> bd #<CR>', opts)
vim.keymap.set('n', '<leader>c', '<Plug>NERDCommenterToggle', opts)
vim.keymap.set('v', '<leader>c', '<Plug>NERDCommenterToggle<CR>gv', opts)
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>', opts)

vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', 'gc', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set("n", 'gr', '<Cmd>Trouble lsp_references<cr>', opts)

vim.keymap.set('n', '<space>g', ':Neogit<CR>', opts)
vim.keymap.set('n', '<space>o', ':SymbolsOutline<CR>', opts)
vim.keymap.set("n", '<space>a', '<Cmd>Trouble document_diagnostics<CR>', opts)
