-------------------
-- vim-plug
-------------------
vim.cmd([[
call plug#begin(stdpath('config').'/plugged')
Plug 'https://hub.fastgit.xyz/scrooloose/nerdtree'
Plug 'https://hub.fastgit.xyz/easymotion/vim-easymotion'
Plug 'https://hub.fastgit.xyz/tpope/vim-fugitive'
Plug 'https://hub.fastgit.xyz/neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://hub.fastgit.xyz/junegunn/fzf'
Plug 'https://hub.fastgit.xyz/junegunn/fzf.vim'
Plug 'https://hub.fastgit.xyz/octol/vim-cpp-enhanced-highlight'
Plug 'https://hub.fastgit.xyz/sheerun/vim-polyglot'
Plug 'https://hub.fastgit.xyz/airblade/vim-gitgutter'
Plug 'https://hub.fastgit.xyz/preservim/nerdcommenter'
Plug 'https://hub.fastgit.xyz/kyazdani42/nvim-web-devicons'
Plug 'https://hub.fastgit.xyz/nvim-lualine/lualine.nvim'
Plug 'https://hub.fastgit.xyz/akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'https://hub.fastgit.xyz/folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()
]])

-------------------
-- lualine
-------------------
require('lualine').setup{
  options={
    theme='tokyonight',
    icons_enabled=false,
    section_separators='',
    component_separators='',
  }
}

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = 0
vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}

vim.cmd("colorscheme tokyonight")

-------------------
-- nerdcommenter
-------------------
vim.g.NERDCreateDefaultMappings = 0 -- dont't create mappings
vim.g.NERDSpaceDelims = 1 -- add spaces after comment delimiters by default
vim.g.NERDDefaultAlign = 'left' -- align line-wise comment delimiters flush left instead of following code indentation

-------------------
-- bufferline
-------------------
require("bufferline").setup{
  options={
    show_buffer_icons=false,
    buffer_close_icon='x',
  }
}

-------------------
-- vim-gitgutter
-------------------
vim.g.gitgutter_map_keys = 0 -- don't want vim-gitgutter to set up any mappings at all
vim.g.gitgutter_preview_win_floating = 1 -- use floating/popup windows for hunk previews

-------------------
-- coc
-------------------
vim.cmd([[

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

]])
