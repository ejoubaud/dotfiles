"------------------------------------------------------------
" vim-plug setup
"
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'jvirtanen/vim-octave'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'lifepillar/vim-solarized8'
Plug 'unblevable/quick-scope'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/ZoomWin'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'bling/vim-airline'
Plug 'sk1418/QFGrep'
Plug 'dyng/ctrlsf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'moll/vim-bbye'
Plug 'ludovicchabant/vim-gutentags'
Plug 'matze/vim-move'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-peekaboo'
Plug 'styled-components/vim-styled-components'
Plug 'dunckr/js_alternate.vim'
Plug 'rust-lang/rust.vim'
Plug 'prettier/vim-prettier'
Plug 'rhysd/vim-clang-format'
Plug 'mcchrish/nnn.vim'
Plug 'lambdalisue/fern.vim', { 'branch': 'main' }
Plug 'lambdalisue/fern-hijack.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-terraform'

" code completion in rust and others, ensure nodejs is installed:
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" switch to term and lazygit
Plug 'voldikss/vim-floaterm'
Plug 'github/copilot.vim'

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

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Default to good folds for programming
set foldmethod=indent
set foldlevelstart=99

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
set termguicolors
colorscheme solarized8
set cursorline
set cursorcolumn

" Change cursor style in insert mode
" Note: These escape sequence are for iterm2 and may break other terms
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

" Full-screen help
set helpheight=99999

" Avoid delays on esc/keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=0

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
" and <A-d> (delete next word) and <A-BS> (delete previous word)
" in VIM command mode (ex)
" Works only in terms that has Alt send Escape sequence
" see http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
cnoremap b <S-Left>
cnoremap f <S-right>
cnoremap d <S-right><Delete>
cnoremap <BS> <C-w>

" Smarter C-n and C-p in console mode: same completion as up and down
cnoremap <C-n>  <down>
cnoremap <C-p>  <up>

" Remap Escape character
inoremap jj <ESC>

" Inremental search
set incsearch

" Show netrw as a tree by default
let g:netrw_liststyle=3
let g:netrw_banner = 0
let g:netrw_localrmdir="rm -r"

" Max line length on Markdown files
augroup auFileTypes
  autocmd!
  autocmd FileType markdown setlocal textwidth=100
augroup end

" fzf
nmap <C-P> :GitFiles --others --exclude-standard --cached<CR>
nmap <C-F> :Buffers<CR>

" case-insensitive search by default
set ignorecase

" Ack/Ag config
if executable('ag')
  let g:ackprg = 'ag --vimgrep --hidden --ignore .git'
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
let g:airline#extensions#tabline#buffer_min_count = 2
" Hide git branch (all extensions, including 'branch' are active by default)
let g:airline_extensions = ['tabline']

" vim-move config
" for terms that send Alt as Escape sequence
" see http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
" for why the <F20> hack. Keeps Esc from waiting for other keys to exit visual
set <F20>=j
set <F21>=k
vmap <F20> <Plug>MoveBlockDown
vmap <F21> <Plug>MoveBlockUp
nmap <F20> <Plug>MoveLineDown
nmap <F21> <Plug>MoveLineUp


" Easymotion config
" Default prefix: <Leader> instead of <Leader><Leader>
map <Leader> <Plug>(easymotion-prefix)

" Peekaboo config
let g:peekaboo_delay = 300

" JS alternate
nnoremap <leader>t :call js_alternate#run()<cr>

" vim-prettier: autoformat on projects with a config file
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1
" Ignore vim-prettier's default settings (e.g. tab-width=4) when a config file
" is found
let g:prettier#config#config_precedence = 'prefer-file'
" fix conflict with vim-polyglot, setting typefile to typescriptreact
" while vim-prettier expected typescript to trigger autoformat save hook
autocmd BufWritePre *.ts,*.tsx call prettier#Autoformat()

" clang-format
" autoformat on save
let g:clang_format#auto_format = 1
" autoformat only when .clang-format or _clang-format found in dir
let g:clang_format#enable_fallback_style = 0
" autoformat only for cpp files
let g:clang_format#auto_filetypes = ['cpp']

" go tabs
autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
" coc
" for rust, you need rls: rustup component add rls rust-analysis rust-src
" for ruby, you need solargraph: gem install solargraph; solargraph config
let g:coc_global_extensions = ['coc-rust-analyzer', 'coc-solargraph', 'coc-snippets']
" auto-install solargraph gem on ruby upgrades
" Function to check and install solargraph gem if not installed
function! CheckAndInstallSolargraph()
  let l:check_gem = system('gem list solargraph -i')
  if v:shell_error != 0
    echo "Installing solargraph gem..."
    let l:install_gem = system('gem install solargraph')
    if v:shell_error == 0
      echo "Solargraph gem installed successfully."
    else
      echo "Failed to install solargraph gem."
    endif
  else
    echo "Solargraph gem is already installed."
  endif
endfunction
autocmd VimEnter * call CheckAndInstallSolargraph()

" floaterm
let g:floaterm_height = 0.95
let g:floaterm_width = 0.95
command Glg FloatermNew lazygit

" nnn
" let g:nnn#replace_netrw = 1

" fern.vim
noremap - :Fern . -reveal=%<CR>
" show hidden files
let g:fern#default_hidden = 1
" fix tmux-vim-navigator mappings in fern
function! s:init_fern() abort
  nmap <buffer><nowait> <C-j> :<C-U>TmuxNavigateDown<cr>
  nmap <buffer><nowait> <C-k> :<C-U>TmuxNavigateUp<cr>
  nmap <buffer><nowait> <C-h> :<C-U>TmuxNavigateLeft<cr>
  nmap <buffer><nowait> <C-l> :<C-U>TmuxNavigateRight<cr>
  nmap <C-P> :GitFiles --others --exclude-standard --cached<CR>
  nmap <C-F> :Buffers<CR>
endfunction
augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

" vim-terraform
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" vim-go
let g:go_metalinter_autosave = 1

