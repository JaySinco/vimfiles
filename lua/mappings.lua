local opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, silent = true, expr = true }

vim.keymap.set('n', '""', ':registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>', opts)

vim.keymap.set('n', '<C-Left>', ':BufferLineCyclePrev<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':BufferLineCycleNext<CR>', opts)

vim.keymap.set('n', '<leader>p', ':GFiles<CR>', opts)
vim.keymap.set('n', '<leader>g', ':Neogit<CR>', opts)
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bp <BAR> bd #<CR>', opts)
vim.keymap.set('n', '<leader>d', '<cmd>Gitsigns preview_hunk<CR>', opts)
vim.keymap.set('n', '<leader>e', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', opts)
vim.keymap.set('n', '<leader>c', '<Plug>NERDCommenterToggle', opts)
vim.keymap.set('v', '<leader>c', '<Plug>NERDCommenterToggle<CR>gv', opts)

vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', 'gc', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

vim.keymap.set("n", "<space>r", "<cmd>Trouble lsp_references<cr>", opts)
vim.keymap.set("n", "<space>a", "<cmd>Trouble document_diagnostics<cr>", opts)
