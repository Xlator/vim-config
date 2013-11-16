"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Viktor Jackson / viktor@vxj.se / github.com/Xlator
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Powerline
set rtp+=/Users/xlator/.local/share/powerline/powerline/bindings/vim

"""" Basic """"

    " The golden rule
    set nocompatible

    "Shell
    set shell=/bin/zsh

    "Pathogen
    " call pathogen#helptags()
    " call pathogen#runtime_append_all_bundles()

    "Detect filetype
    filetype plugin on
    filetype plugin indent on

    "Hidden buffers
    set hidden

    "Undo/swap/info files
    set undofile
    set undodir^=~/.vimswap/undo//
    set dir^=~/.vimswap//
    set viminfo+=n~/.vimswap/info

    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500

    "dbext profiles
    source ~/.vim/include/dbext

    "Snippets
    source ~/.vim/include/snippets

    set laststatus=2 "Always show status line

    " Don't try to highlight lines longer than 300 characters.
    set synmaxcol=300

    set noshowmode

"""" Vundle  """"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"
source .vim/include/bundles

"""" Rendering """"

    set number
    set t_Co=256
    set foldmethod=syntax
    set background=dark
    syntax on
    " solarized options 
    let g:solarized_termcolors = 256
    let g:solarized_visibility = "high"
    let g:solarized_contrast = "high"
    let g:solarized_termtrans = 1
    colorscheme solarized

    set modeline
    set modelines=1

    " Don't redraw during macro execution
    set lazyredraw

"""" Indenting """"

    set tabstop=4
    set expandtab
    set shiftwidth=4
    set listchars=tab:▸\ ,eol:¬,trail:•

"""" Searching/highlighting """"

    "Highlight current line
    set cul

    "Highlight search
    set hlsearch

    "Toggle search highlighting, invisibles and spell checking using <CR>
    nnoremap <Leader><CR> :noh<CR>:set list!<CR>:set spell!<CR>

    "Case insensitive search
    set ignorecase
    set smartcase

"""" vimgrep search """"

    " When you press gv you vimgrep after the selected text
    vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

    " Open vimgrep and put the cursor in the right position
    map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

    " Vimgreps in the current file
    map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

    " When you press <leader>r you can search and replace the selected text
    vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

    " Do :help cope if you are unsure what cope is. It's super useful!
    "
    " When you search with vimgrep, display your results in cope by doing:
    "   <leader>cc
    "
    " To go to the next search result do:
    "   <leader>n
    "
    " To go to the previous search results do:
    "   <leader>p
    "
    map <leader>cc :botright cope<cr>
    map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>

"""" Wildcard """"

    set wildignore=*.swp,*.bak,*.pyc,*.class,*/.git/*,.DS_Store

    " Don't show me the vendor directory
    set wildignore+=*/vendor/**

    " Wild menu
    set wildmenu

"""" Autocompletion """"

    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP

    " Better Completion
    set complete=.,w,b,u,t
    set completeopt=longest,menuone,preview

"""" Splits/windows/tabs """"

    "Fast window switching
    nnoremap <left> <C-W>h
    nnoremap <right> <C-W>l
    nnoremap <up> <C-W>k
    nnoremap <down> <C-W>j

"""" PHP Stuff """"

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

    "XDebug toggle breakpoint
    map <silent> <F9> :python debugger_mark()<CR>

    " Laravel and PHPUnit bindings
    nmap ,t :!phpunit<cr>
    nmap ,d :!composer dump-auto -o<cr>
    nmap ,l :!php artisan 
    nmap ,sp :e app/config/app.php<cr>81G$%
    nmap ,db :e app/config/database.php<cr>29G$2bci'
    nmap ,r :e app/routes.php<cr>
    nmap ,c :e composer.json<cr>
    nmap ,C :!codecept run<cr>
    nmap ,b :e bower.json<cr>
    

"""" General editing """"

    "Allow backspacing anything in insert mode
    set backspace=2 

    " Treat long lines as break lines
    nnoremap j gj
    nnoremap k gk

    " Remap VIM 0 to first non-blank character
    map 0 ^

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

    " Highlight Word {{{
    " https://github.com/sjl/dotfiles/blob/master/vim/vimrc
    " This mini-plugin provides a few mappings for highlighting words temporarily.
    "
    " Sometimes you're looking at a hairy piece of code and would like a certain
    " word or two to stand out temporarily. You can search for it, but that only
    " gives you one color of highlighting. Now you can use <leader>N where N is
    " a number from 1-6 to highlight the current word in a specific color.

    " Mappings {{{
    nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
    nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
    nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
    nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
    nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
    nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

    " }}}
    " Default Highlights {{{
    hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
    hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
    hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
    hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
    hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
    hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
    " }}}

"""" Autocommands """"

    "Auto-reload .vimrc on change
    augroup myvimrchooks
        au!
        autocmd bufwritepost .vimrc source ~/.vimrc
    augroup END

    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
    " Remember info about open buffers on close
    set viminfo^=%

    " Delete trailing white space on save, useful for Python and CoffeeScript ;)
    func! DeleteTrailingWS()
      exe "normal mz"
      %s/\s\+$//ge
      exe "normal `z"
    endfunc
    autocmd BufWrite *.py :call DeleteTrailingWS()
    autocmd BufWrite *.coffee :call DeleteTrailingWS()
    autocmd BufWrite *.php :call DeleteTrailingWS()

"""" Plugins """"

    
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

    "Use Ctrl-P Funky for function search
    nnoremap <Leader>fu :CtrlPFunky<Cr>
    " narrow the list down with a word under cursor
    nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
    " Replace LustyJuggler with CtrlP Buffer
    nnoremap <Leader>lj :CtrlPBuffer<cr>
    "Use original FuzzyFinder for searching tags
    nnoremap <Leader>T :FufTag<CR>

    " Gundo
    nnoremap <Leader>u :GundoToggle<CR>
    let g:gundo_preview_bottom = 1

    " Emmet
    let g:user_emmet_settings = { 'php': { 'extends': 'html' }, 'blade': { 'extends': 'html' } }
    let g:user_emmet_leader_key = '\\'

    " YouCompleteMe
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_filetype_specific_completion_to_disable = {'php':''}

    " DelimitMate
    let delimitMate_balance_matchpairs = 1
    let delimitMate_expand_cr = 1

    imap <expr> <CR> pumvisible()
                     \ ? "\<C-Y>"
                     \ : "<Plug>delimitMateCR"

"""" Misc. bindings """"

    "Toggle foldcolumn
    nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

    "Toggle pastemode
    map <F3> :set invpaste<CR>

    "Turn off indentation
    nnoremap <F8> :setl noai nocin nosi inde=<CR>

    " Remove the Windows ^M - when the encodings gets messed up
    noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

    " Quick buffer for notes
    map <leader>q :Sscratch<cr>

    " :W to force save
    command! W w !sudo tee % > /dev/null

    "Toggle folds with spacebar
    nnoremap <space> za
    nnoremap <Leader><space> zi

    "Edit vimrc
    nnoremap <leader>ev <C-w><C-v>:e $MYVIMRC<CR>

    "Spell check
    nnoremap <Leader>Se :set spell spelllang=en<CR>
    nnoremap <Leader>Ss :set spell spelllang=sv<CR>
    nnoremap <Leader>So :set nospell<CR>

    " Search dash
    nmap <silent> <Leader>d <Plug>DashSearch

"""" Helper functions """"

    function! CmdLine(str)
        exe "menu Foo.Bar :" . a:str
        emenu Foo.Bar
        unmenu Foo
    endfunction

    function! VisualSelection(direction, extra_filter) range
        let l:saved_reg = @"
        execute "normal! vgvy"

        let l:pattern = escape(@", '\\/.*$^~[]')
        let l:pattern = substitute(l:pattern, "\n$", "", "")

        if a:direction == 'b'
            execute "normal ?" . l:pattern . "^M"
        elseif a:direction == 'gv'
            call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
        elseif a:direction == 'replace'
            call CmdLine("%s" . '/'. l:pattern . '/')
        elseif a:direction == 'f'
            execute "normal /" . l:pattern . "^M"
        endif

        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction

    function! HiInterestingWord(n) " {{{
    " Save our location.
        normal! mz

    " Yank the current word into the z register.
        normal! "zyiw

    " Calculate an arbitrary match ID. Hopefully nothing else is using it.
        let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
        silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
        let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
        call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
        normal! `z
    endfunction " }}}

    " CSV column highlight
    function! CSVH(colnr)
      if a:colnr > 1
        let n = a:colnr - 1
        execute 'match Keyword /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
        execute 'normal! 0'.n.'f,'
      elseif a:colnr == 1
        match Keyword /^[^,]*/
        normal! 0
      else
        match
      endif
    endfunction
    command! -nargs=1 Csv :call CSVH(<args>)
