function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

nmap('<C-Left>' , ':BufferLineCyclePrev<CR>')
nmap('<C-Right>', ':BufferLineCycleNext<CR>')

nmap('<leader>p', ':GFiles<CR>')
nmap('<leader>g', ':Neogit<CR>')
nmap('<leader>t', ':NvimTreeToggle<CR>')
nmap('<leader>n', ':NvimTreeFindFile<CR>')
nmap('<leader>x', ':bp <BAR> bd #<CR>')
nmap('<leader>d', '<cmd>Gitsigns preview_hunk<CR>')
nmap('<leader>c', '<Plug>NERDCommenterToggle')
vmap('<leader>c', '<Plug>NERDCommenterToggle<CR>gv')

nmap('gd', '<Plug>(coc-definition)')
nmap('gy', '<Plug>(coc-type-definition)')
nmap('gc', '<Plug>(coc-declaration)')
nmap('gi', '<Plug>(coc-implementation)')
nmap('gr', '<Plug>(coc-references)')

nmap('<space>a', ':<C-u>CocList diagnostics<cr>')
nmap('<space>e', ':<C-u>CocList extensions<cr>')
nmap('<space>c', ':<C-u>CocList commands<cr>')
nmap('<space>o', ':<C-u>CocList outline<cr>')
nmap('<space>s', ':<C-u>CocList -I symbols<cr>')
nmap('<space>p', ':<C-u>CocListResume<cr>')

nmap('""', ':registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>')
nmap('K', ':call ShowDocumentation()<CR>')

vim.api.nvim_set_keymap('i',
    '<TAB>', 
    [[pumvisible() ? "\<C-n>" : CheckBackspace() ? "\<TAB>" : coc#refresh()]],
    {expr = true, noremap = true, silent = true}
)
