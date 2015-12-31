"------------------------------------------------------------
" vim-plug setup
"
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'altercation/vim-colors-solarized'
Plug 'unblevable/quick-scope'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/ZoomWin'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'bling/vim-airline'
Plug 'sk1418/QFGrep'
" To consider for later
" Plug 'tpope/vim-rails'
Plug 'dyng/ctrlsf.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'matze/vim-move'

" Add plugins to &runtimepath
call plug#end()

"
" Config from http://vim.wikia.com/wiki/Example_vimrc
"
"------------------------------------------------------------
" Features
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options
"
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------
" My own setup
"
let mapleader = ","

" Theme
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
set cursorline
set cursorcolumn

" Full-screen help
set helpheight=99999

" Emacs shortcuts in VIM command mode (ex)
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <C-g>  <C-c>
" Emacs shortcuts for <A-b> (back one word), <A-f> (forward one word) 
" and <A-d> (delete next word) in VIM command mode (ex)
" Works only in terms that has Alt send Escape sequence
" see http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
" for why the <F13> hack. Keeps Esc from waiting for other keys to close ex
set <F13>=b
set <F14>=f
set <F15>=d
cnoremap <F13> <S-Left>
cnoremap <F14> <S-Right>
cnoremap <F15> <S-right><Delete>

" Fix deleting words with <A-BS> when terminal has Alt send Escape sequence
" see http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
" for why the <F16> hack. Keeps Esc from waiting for other keys to close ex.
set <F16>=
inoremap <F16> <C-w>
cnoremap <F16> <C-w>

" Remap Escape character
inoremap jj <ESC>


" Show dotfiles in ctrlp
let g:ctrlp_show_hidden = 1

" Use case insensitive search, even with capital letters (because it's used by
" CtrlP and messes with CamelCase searches)
set ignorecase
set nosmartcase
" Turn Class::Name into Class/Name into ctrlp search
let g:ctrlp_abbrev = {
  \ 'gmode': 'i',
  \ 'abbrevs': [
    \ {
      \ 'pattern': '::',
      \ 'expanded': '/',
      \ 'mode': 'pfrz',
    \ },
  \ ]
\ }
" Fix missing files in ctrlp
let g:ctrlp_max_files=0
let g:ctrlp_match_window = 'results:200'
" Faster ctrlp with Ag
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" Enable Python matcher for CtrlP
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" Set root to gem root when browsing a ruby gem
let g:ctrlp_root_markers = [ '*.gemspec' ]
" Fix <A-BS> closing Ctrlp prompt
let g:ctrlp_prompt_mappings = {
  \ 'PrtDeleteWord()':      ['<Esc><BS>', '<c-w>'],
\ }

" Ack/Ag config
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" Quit auto-opening first result on search
cabbrev Ack Ack!
" Close results when browsing one
let g:ack_autoclose = 1
noremap <Leader>a :call ack#ShowResults()<CR>

" Airline config
" Show buffers at the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_min_count = 3
" vim-move config
" for terms that send Alt as Escape sequence
vmap <ESC>j <Plug>MoveBlockDown
vmap <ESC>k <Plug>MoveBlockUp
nmap <ESC>j <Plug>MoveLineDown
nmap <ESC>k <Plug>MoveLineUp

