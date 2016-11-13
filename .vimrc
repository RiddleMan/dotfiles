
set nocompatible
filetype off

" Vundle setup START
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugins list
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'geekjuice/vim-mocha'

" JS
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jelera/vim-javascript-syntax'


" Vundle END
call vundle#end()
filetype plugin indent on

" SETTINGS
set laststatus=2
let g:airline_theme = 'solarized' 
let g:airline_powerline_fonts = 1
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']
set autochdir

set t_Co=256
syntax on
set background=dark
set nu
" TODO: I have to review those to remove some unesecerry
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"
let g:javascript_plugin_flow = 1
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'


" mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
