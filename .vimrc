"Shell
set shell=/usr/local/bin/zsh

"Pathogen
call pathogen#infect()

"Detect filetype
filetype plugin on
filetype plugin indent on

"Hidden buffers
set hidden

"Undo/swap/info files
set undofile
set undodir^=~/.vimswap/undo//
set dir^=~/.vimswap//
set viminfo+=n~/.viminfo

"Rendering
set number
set nocompatible
set t_Co=256
set foldmethod=syntax
source ~/.vimcolor

set modeline
set modelines=1

set tabstop=4
set expandtab
set shiftwidth=4
set listchars=tab:▸\ ,eol:¬,trail:•

set backspace=2 "Allow backspacing anything in insert mode

"Highlight current line
set cul

"Highlight search
set hlsearch

"Toggle search highlighting, invisibles and spell checking using <CR>
nnoremap <CR> :noh<CR>:set list!<CR>:set spell!<CR>

"Case insensitive search
set ignorecase
set smartcase

"Mappings
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
map <F3> :set invpaste<CR>
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
nnoremap <F8> :setl noai nocin nosi inde=<CR>

"Fast window switching
nnoremap <left> <C-W>h
nnoremap <right> <C-W>l
nnoremap <up> <C-W>k
nnoremap <down> <C-W>j

"Toggle folds with spacebar
nnoremap <space> za
nnoremap <Leader><space> zi

" Remap VIM 0 to first non-blank character
map 0 ^

"Edit vimrc
nnoremap <leader>ev <C-w><C-v>:e $MYVIMRC<CR>

"Auto-reload .vimrc on change
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

"dbext profiles
source ~/.vim/include/dbext

"Snippets
source ~/.vim/include/snippets

"PHP Lint
autocmd FileType php noremap <Leader>M :w!<CR>:!/usr/bin/php %<CR>
autocmd FileType php noremap <Leader>L :w!<CR>:!/usr/bin/php -l %<CR>

" PHP settings
let php_special_vars = 0
let php_special_functions = 0
let php_folding = 2
let php_alt_arrays = 2
let php_fold_arrays = 1
let php_sql_query = 1
let php_htmlInStrings = 1

"Completion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"More informative status line
" set statusline=
" set statusline=%<\ \  "Truncation
" set statusline+=%#PreProc#[%n]\  "Buffer number
" set statusline+=%#vimCommand#%F\ %#Statement#(%{&ft})%*  "Filename and type
" set statusline+=%r%m%h%= "Flags
" set statusline+=col%c\  "Column
" set statusline+=%p%%  "Percent of file

set laststatus=2 "Always show status line

"Spell check
nnoremap <Leader>Se :set spell spelllang=en<CR>
nnoremap <Leader>Ss :set spell spelllang=sv<CR>
nnoremap <Leader>So :set nospell<CR>

"CSS colour highlighting
autocmd FileType css,scss :ColorHighlight

"Syntastic
let g:syntastic_error_symbol='x'
let g:syntastic_style_error_symbol='?'

"Powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'default'
let g:Powerline_theme = 'default'

"Ctrl-P - Fuzzy finder in pure VimScript
let g:ctrlp_map = '<Leader>t' "Use Command-T binding...
let g:ctrlp_match_window_reversed = 0

"Use original FuzzyFinder for searching tags
nnoremap <Leader>T :FufTag<CR>

"Set cursor inside braces/quotes
inoremap '' ''<Left>
inoremap "" ""<Left>
inoremap () ()<Left>
inoremap <> <><Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>

"Quickly add comma or semicolon at the end of the line
inoremap ,, <End>,
inoremap ;; <End>;

"XDebug toggle breakpoint
map <silent> <F9> :python debugger_mark()<CR>
