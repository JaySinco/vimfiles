local opts = { noremap = true, silent = true }

vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '""', ':registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<cr>', opts)
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)

vim.keymap.set('n', '<C-Left>', ':BufferLineCyclePrev<cr>', opts)
vim.keymap.set('n', '<C-Right>', ':BufferLineCycleNext<cr>', opts)

vim.keymap.set('n', '<leader>w', ':w!<cr>', opts)
vim.keymap.set('n', '<leader><cr>', ':nohlsearch<cr>', opts)
vim.keymap.set('n', '<leader>x', ':bp <BAR> bd #<cr>', opts)
vim.keymap.set('n', '<leader>f', function() require 'telescope.builtin'.live_grep {} end, opts)
vim.keymap.set('n', '<leader>p', function() require 'telescope.builtin'.git_files {} end, opts)
vim.keymap.set('n', '<leader>b', ':NvimTreeToggle<cr>', opts)
vim.keymap.set('n', '<leader>t', ':NvimTreeFindFile<cr>', opts)
vim.keymap.set('n', '<leader>c', '<Plug>NERDCommenterToggle', opts)
vim.keymap.set('v', '<leader>c', '<Plug>NERDCommenterToggle<cr>gv', opts)

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', 'gc', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set("n", 'gr', ':Trouble lsp_references<cr>', opts)

vim.keymap.set('n', '<space>g', ':Neogit<cr>', opts)
vim.keymap.set('n', '<space>o', ':SymbolsOutline<cr>', opts)
vim.keymap.set("n", '<space>a', ':Trouble document_diagnostics<cr>', opts)
vim.keymap.set('n', '<space>m', '<Cmd>exe v:count1 . "ToggleTerm"<cr>', opts)
