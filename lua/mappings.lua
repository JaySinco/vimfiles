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

nmap('""', ':registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>')

nmap('<leader>p', ':GFiles<CR>')
nmap('<leader>t', ':NERDTreeToggle<CR>')
nmap('<leader>n', ':NERDTreeFind<CR>')
nmap('<leader>d', '<Plug>(GitGutterPreviewHunk)')
