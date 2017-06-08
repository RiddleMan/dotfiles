set nocompatible
set noesckeys
filetype off

" Vundle setup START
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugins list
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-obsession'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'geekjuice/vim-mocha'

" JS
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'w0rp/ale'

" Vundle END
call vundle#end()
filetype plugin indent on

" Vim colors
set background=dark
colorscheme solarized
set conceallevel=1

" SETTINGS
set laststatus=2
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:jsx_ext_required = 0
set autochdir

" ALE linters
let g:ale_linters = {
\  'javascript': ['eslint'],
\}
let g:ale_fixers = {
\  'javascript': [
\    'eslint'
\  ],
\}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '‼'
let g:ale_sign_warning = '⚠'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

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

" TODO: vim-mocha settings
" let g:mocha_js_command = "!node $(npm bin)/mocha {spec}"

" pangloss/vim-javascript
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
let g:javascript_plugin_flow = 1"

" JavaScript
set suffixesadd+=.js

" mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd VimEnter * Obsess
