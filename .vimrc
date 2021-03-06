" ==============================================
"               vanilla vimrc
" ==============================================
"


" don't bother with vi compatibility
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on
"setlocal spell spelllang=en_us
" disable folding
set nofoldenable
" Turn off Esc+O key sequences (eliminates one-second delay when pressing O) https://superuser.com/a/161216
" [if this is re-enabled i may stab someone.]
set noesckeys
" timeout of 5 ms
set ttimeoutlen=5
" don't break words with wrap on
set linebreak
" put swap files in one place, instead of in-place
set directory=~/.vim/swap
" don't make these keys do annoying things
nnoremap <F1> <nop>
nnoremap J mzJ`z
nnoremap n nzz
nnoremap } }zz
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>
" use j and k to move among display lines, not just file lines
noremap j gj
noremap k gk
" if compiled with autocmd, jump to last cursor position
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif " has("autocmd")
" in Python, don't move comment hashtag to first column.
" smartindent unnecessary for python anyway.
" http://stackoverflow.com/questions/2063175/vim-insert-mode-comments-go-to-start-of-line
au! FileType python setl nosmartindent
" allow visual mode to go to blank space at end of lines
set virtualedit=block
" horizontal and vertical splits should go in right place
set splitbelow
set splitright
" turn on syntax highlighting
syntax on
set ic
" this highlights search items
set hls
" this highlights search items as they are typed
set incsearch
hi IncSearch cterm=none ctermfg=blue ctermbg=green
" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
" toggle search highlighting:
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" turn off splash message
set shortmess+=I
" allow backspacing after first insert spot
set backspace=indent,eol,start
" murder that cursed blinking cursor
let &guicursor = &guicursor . ",a:blinkon0"
" Do special stuff for Makefiles:
" don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
au BufRead,BufNewFile Makefile*,*.make,*.mk set noexpandtab
" otherwise = 4 or even 8 (the 8 looks nice)
au BufRead,BufNewFile *.cpp,*.cxx,*.cc,*.c,*.h,*.hpp,*.hxx,*.hh set tabstop=4 shiftwidth=4 softtabstop=4 nowrap
" line numbering - make it more readable
set ruler
" eliminate line wrapping
set nowrap
" tabs are 4 spaces: the *correct* way
set tabstop=4 shiftwidth=4 expandtab
set nosmartindent   " die die die
" color scheme stuff
colorscheme desert
"colorscheme solarized
" correct my common typos without me even noticing them:
abbreviate teh the
abbreviate hte the
abbreviate reccommend recommend
abbreviate reccomend recommend
abbreviate recomend recommend
abbreviate slef self
"
" :e <tab> brings up longest; <tab> again shows list
set wildmode=longest,list
if exists('+autochdir')
  " so :e is relative to current file
  set autochdir
endif
" Running command :CD will change to current file's directory
com! CD cd %:p:h
" allow quit via double keypress
map XX :q!<CR>
map QQ :wq<CR>
map WQ :wq<CR>
map WW :w<CR>
if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif
" don't autoindent markdown files
filetype plugin indent on
au filetype mkd call DisableIndent()
function! DisableIndent()
        set autoindent&
        set cindent&
        set smartindent&
        set indentexpr&
endfunction
" Persistent Undo
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif
" Shift+Tab should de-indent
" Control + D is de-indent
inoremap <S-Tab> <C-d>
set autoindent
set backspace=2                                              " Fix broken backspace in some setups
set clipboard=unnamed                                        " yank and paste with the system clipboard
set encoding=utf-8
set ruler                                                    " show where you are
set showcmd
set smartcase                                                " case-sensitive search if any caps
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.pyc
" keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" Don't copy the contents of an overwritten selection.
vnoremap p "_dP
" Enhance command-line completion
set wildmenu
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Don’t add empty newlines at the end of files
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swap
if exists("&undodir")
	set undodir=~/.vim/undo
endif
" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
"""set exrc
"""set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess+=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=7
" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " Treat .md files as Markdown
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
" Mark special characters
set listchars=nbsp:☠,tab:▸␣
"set listchars=tab:▸␣
set list
