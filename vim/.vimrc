set nocompatible
set noesckeys
filetype plugin on

" Sets good tab settings for Vim
set ts=4 sts=4 sw=4 expandtab

" Sets external vim scripts
set exrc
set secure

" Sets zsh autocomplete
set wildmenu
set wildmode=full

set hls

" Vundle setup START
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugins list
Plugin 'wincent/terminus'
Plugin 'sirver/ultisnips'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'

" JS
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'editorconfig/editorconfig-vim'

" Vundle END
call vundle#end()
filetype plugin indent on

" Vim colors
set background=dark
colorscheme solarized

" SETTINGS
set laststatus=2
set autoread
set backupcopy=yes
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:jsx_ext_required = 0
set autochdir

" Ultisnips settings
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips/"
let g:UltiSnipsEditSplit="vertical"

set t_Co=256
syntax on
set background=dark
set nu

" Ctrlp settings
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'

" JavaScript
set suffixesadd+=.js

" ag as default search
"
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0 
endif  

autocmd Filetype gitcommit setlocal spell textwidth=72
