call plug#begin('~/.vim/plugged')

" vim config plugins
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bling/vim-airline'
Plug 'ntpeters/vim-airline-colornum'
Plug 'blueyed/vim-diminactive'
Plug 'MarcWeber/vim-addon-mw-utils' " interpret a file by function and cache file automatically
Plug 'tomtom/tlib_vim'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'w0rp/ale'
Plug 'dense-analysis/ale'
" Plug 'mhinz/vim-startify'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/EasyGrep'
Plug 'vim-scripts/LargeFile'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/surround.vim' " cs'[char to surrond]
Plug 'vim-scripts/rainbow-end'
Plug 'vim-scripts/vim-qf'

" Snippets engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine.
Plug 'honza/vim-snippets'

" syntax
Plug 'jiangmiao/auto-pairs'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/svg-properties-syntax.vim'
Plug 'othree/html5.vim'
Plug 'ap/vim-css-color'

" format
Plug 'AndrewRadev/splitjoin.vim' " gS | gJ
" Plug 'terryma/vim-multiple-cursors' " <C-n> multiple times to select cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " <C-n> multiple times to select cursors
Plug 'tpope/vim-commentary' " comment code gcc

" git
Plug 'tpope/vim-fugitive'  " Gdiff, Gedit, Gstatus, Gblame
Plug 'airblade/vim-gitgutter'  " shows which line edited/removed

" ruby/rails
Plug 'slim-template/vim-slim'
Plug 'p0deje/vim-ruby-interpolation'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'   " (?)
Plug 'tpope/vim-haml'

" js
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'mustache/vim-mustache-handlebars'

Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'github/copilot.vim'

call plug#end()

set encoding=UTF-8

" Vim
syntax on
colorscheme onedark
" colo railscasts                   " Theme
" set guifont=Menlo:h16             " Font
set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono:h14        " Font
set expandtab ts=2 sw=2 ai        " Two spaces instead tab
set showtabline=2                 " Always shows tabs on top
set backspace=indent,eol,start    " Intuitive backspacing.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set scrolloff=10                  " Show 3 lines of context around the cursor.
set visualbell                    " No beeping.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " Disable swp files
set shortmess=filmnrxtTI          " Disble intro message
set nohidden                      " Remove the buffer after tab close
set novisualbell
set list
set listchars=trail:•             " Show spaces in end of line
set autoread                      " Update open files when changed externally
set relativenumber                " Set relative line numbers
set number                        " Set line numbers
set iskeyword-=_                  " Underscore brakes the word
set laststatus=2
set ignorecase
set smartcase
" set re=1
set ttyfast
set lazyredraw
set nocursorcolumn
set nocursorline
syntax sync minlines=256
set synmaxcol=160
set clipboard=unnamed
set noballooneval
filetype plugin on                " Turn on file type detection.
filetype indent on                " Turn on file indent detection.
set tags=tmp/

" NERDTree
map <C-Bslash> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
let g:NERDTreeHijackNetrw=0

" Copilot
let g:copilot_filetypes = { 'rb': v:true, 'js': v:true, 'scss': v:true, 'haml': v:true, 'slim': v:true,
      \ 'erb': v:true, 'css': v:true, 'html': v:true, 'yml': v:true, 'md': v:true, 'tsx': v:true, 'jsx': v:true }
imap <C-l> <Plug>(copilot-next)

" Snippets
let g:UltiSnipsExpandTrigger="<S-Tab>"

" MAPPINGS
autocmd BufWritePre *.* :%s/\s\+$//e
" autocmd BufWritePre {*.rb,*.js,*.coffee,*.scss,*.haml,*.slim,*.erb,*.css,*.html,*.yml} :%s/\s\+$//e
map <C-s> :w<cr>
map <S-r> :%s/:\(\w\+\)\(\s*=>\s*\)/\1: /g<cr>
imap <C-s> <ESC>:w<cr>
map <C-a> <esc>ggVG<end>
vnoremap < <gv
vnoremap > >gv
cmap w!! %!sudo tee > /dev/null %
" autocmd! bufwritepost .vimrc nested source %
inoremap <c-x><c-]> <c-]>
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1

" Bubble single&multiple lines
vnoremap <S-Up> <esc>`<gv:m '<-2<cr>gv
vnoremap <S-Down> <esc>`>gv:m '>+1<cr>gv
nnoremap <S-Up> mz:m-2<cr>`z
nnoremap <S-Down> mz:m+<cr>`z

" Tabs
" nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-Up> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-Down> :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-e>     :q!<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-Up> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-Down> <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <C-e>     <Esc>:q!<CR>i

" stop highlighting text
map no :noh<CR>

" ALE
let g:ale_fix_on_save = 1
let g:lint_on_insert_leave = 1
let g:lint_on_text_changed = 0
let g:ale_fixers = {'ruby': ['rubocop'], 'javascript': ['prettier', 'eslint']}
" let g:ale_sign_column_always=1

" Rgrep
map <C-f> :Rgrep<cr>
let Grep_Default_Filelist = '*.*'
let Grep_Skip_Files = '*.log *.sql *.png *.jpg *.jpeg *.gif'
let Grep_Skip_Dirs = '.git tmp system coverage log solr public _site node_modules'

let g:diminactive_use_colorcolumn = 1
:hi ColorColumn ctermbg=0 guibg=#2b2b2b
let g:diminactive_use_syntax = 0

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|tmp|coverage|log)$'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:10'

nnoremap <silent> <S-tab> :CtrlPBuffer<CR>

" Commentary
map <C-c> <esc>gcc<end>
map <C-x> <esc>gcu<end>
vmap <C-c> gc
map cp "+y<CR>

" Rails
map gV :Eview<CR>
map gC :Econtroller<CR>
map gM :Emodel<CR>
map gH :Ehelper<CR>
map gJ :Ejavascript<CR>
map gS :Estylesheet<CR>

" to start vim maximized
function Maximize_Window()
  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
au GUIEnter * call Maximize_Window()

if exists("+undofile")
    set udf
    set undodir=~/.vim/undo
endif

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Open current directory
map <S-w> :e %:h<CR>

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" :help key-notation

" make modified file [+] to be red
function! AirlineInit()
  " first define a new part for modified
  call airline#parts#define('modified', {
    \ 'raw': '%m',
    \ 'accent': 'red',
    \ })

  " then override the default layout for section c with your new part
  let g:airline_section_c = airline#section#create(['%<', '%f', 'modified', ' ', 'readonly'])
endfunction
autocmd VimEnter * call AirlineInit()