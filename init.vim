"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
let mapleader=","

" Yanking/deleting operations copy to the system clipboard
" set clipboard=unnamedplus

nmap "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

command! BufOnly silent! execute "%bd|e#|bd#"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set encoding=utf8
set termguicolors

lua << END
require('lualine').setup{
  options={
    theme='tokyonight',
    icons_enabled=false,
    section_separators='',
    component_separators='',
  }
}
END

let g:tokyonight_style="storm"
let g:tokyonight_italic_functions=0
let g:tokyonight_sidebars=["qf", "vista_kind", "terminal", "packer"]

silent! colorscheme tokyonight


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a
set number
set cursorline

" Set 7 lines to the cursor
set so=7

" Turn on the Wild menu
set wildmenu

" Height of the command bar
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
set tm=500

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
" set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set vb t_vb=

" Add a bit extra margin to the left
set foldcolumn=1

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and saves
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>
nmap <leader>p :GFiles<CR>

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowritebackup
set noswapfile

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Opening a new file when the current buffer has unsaved changes
" causes files to be hidden instead of closed"
set hidden


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tab and indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>d <Plug>(GitGutterPreviewHunk)

" Don't want vim-gitgutter to set up any mappings at all
let g:gitgutter_map_keys=0

" Use floating/popup windows for hunk previews
let g:gitgutter_preview_win_floating=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dont't create mappings
let g:NERDCreateDefaultMappings=0

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims=1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign='left'

" Toggle comment
nmap <leader>c <Plug>NERDCommenterToggle
vmap <leader>c <Plug>NERDCommenterToggle<CR>gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffer line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << END
require("bufferline").setup{
  options={
     show_buffer_icons=false,
     buffer_close_icon='x',
  }
}
END

nmap <C-Left>  :BufferLineCyclePrev<CR>
nmap <C-Right> :BufferLineCycleNext<CR>
nmap <leader>x :bp <BAR> bd #<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gc <Plug>(coc-declaration)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
