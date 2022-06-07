-------------------
-- vim-plug
-------------------
vim.cmd[[
call plug#begin(stdpath('config').'/plugged')
Plug 'https://hub.fastgit.xyz/nvim-lua/plenary.nvim'
Plug 'https://hub.fastgit.xyz/kyazdani42/nvim-web-devicons'
Plug 'https://hub.fastgit.xyz/kyazdani42/nvim-tree.lua'
Plug 'https://hub.fastgit.xyz/nvim-lualine/lualine.nvim'
Plug 'https://hub.fastgit.xyz/akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'https://hub.fastgit.xyz/folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'https://hub.fastgit.xyz/lewis6991/gitsigns.nvim'
Plug 'https://hub.fastgit.xyz/TimUntersberger/neogit'
Plug 'https://hub.fastgit.xyz/preservim/nerdcommenter'
Plug 'https://hub.fastgit.xyz/junegunn/fzf'
Plug 'https://hub.fastgit.xyz/junegunn/fzf.vim'
Plug 'https://hub.fastgit.xyz/neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://hub.fastgit.xyz/sheerun/vim-polyglot'
Plug 'https://hub.fastgit.xyz/akinsho/toggleterm.nvim', { 'tag': 'v1.*' }
call plug#end()
]]

-------------------
-- tokyonight
-------------------
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_keywords = 0
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.cmd[[colorscheme tokyonight]]

-------------------
-- nvim-tree
-------------------
require('nvim-tree').setup {
    open_on_setup = true,
    open_on_setup_file = true,
    view = {
        side = 'right'
    }
}

-------------------
-- neogit
-------------------
require('neogit').setup {}

-------------------
-- gitsigns
-------------------
require('gitsigns').setup {}

-------------------
-- toggleterm
-------------------
require("toggleterm").setup {}

-------------------
-- lualine
-------------------
require('lualine').setup {
  options = {
    theme = 'tokyonight',
  }
}

-------------------
-- bufferline
-------------------
require("bufferline").setup {}

-------------------
-- nerdcommenter
-------------------
vim.g.NERDCreateDefaultMappings = 0 -- dont't create mappings
vim.g.NERDSpaceDelims = 1 -- add spaces after comment delimiters by default
vim.g.NERDDefaultAlign = 'left' -- align line-wise comment delimiters flush left instead of following code indentation

-------------------
-- coc
-------------------
vim.cmd[[

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

]]