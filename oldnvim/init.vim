"set nocompatible 		" disable compatibility to old vi
"set exrc                        " source vimrc if a folder/file had one in it
set showmatch			" show matching
set ignorecase			" case insensitive search
set noerrorbells                " No noises
set mouse=v			" middle click past
set nohlsearch			" highlight search
set hidden
set incsearch			" incremental search
set tabstop=2			" tab = 2 spaces
set softtabstop=2		" ^
set expandtab			" tab == space
set shiftwidth=2		" width for auto indent
set autoindent			" indent a new line the same amount as the line just typed
set number			" add line numbers
set relativenumber		" add relative numbers
set wildmode=longest,list	" get bash-like tab completions
set cc=80			" border on column 80
set nowrap

" open new split panes to right and below
set splitright
set splitbelow


"History stuff
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set scrolloff=8                 " Dear god I needed this.
set signcolumn=yes

filetype plugin indent on	" auto indent depending on file
syntax on 			" syntax highlighting
set mouse=a			" enable mouse click
set clipboard=unnamedplus	" use system clipboard
filetype plugin on
set cursorline			" highlight current cursorline
set ttyfast			" speeeeeeed scrolling

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin section
call plug#begin("~/.vim/plugged")
  " plugins
  Plug 'dracula/vim' " ColorScheme
  Plug 'EdenEast/nightfox.nvim' " ColorScheme
  Plug 'ryanoasis/vim-devicons' " font awesome dev icons
"  Plug 'SirVer/ultisnips'  " code snippets
  Plug 'honza/vim-snippets' " code snippets
  Plug 'scrooloose/nerdtree' " filetree
  Plug 'preservim/nerdcommenter' " Not sure
  Plug 'mhinz/vim-startify'   " startmenu its pretty
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " code completion
  Plug 'parkr/vim-jekyll' " not sure

  Plug 'vim-airline/vim-airline'

  " This is a requirement, which implements some useful window management
  "   items for neovim
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim' " fuzzy finding
call plug#end()

" color schemes
if (has("termguicolors"))
 set termguicolors
 endif
 syntax enable
 "colorscheme evening
colorscheme nightfox


let mapleader=" "

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>

" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>

" copies filepath to clipboard by pressing yf
:nnoremap <leader> yf :let @+=expand('%:p')<CR>

" copies pwd to clipboard: command yd
:nnoremap <leader> yd :let @+=expand('%:p:h')<CR>

" Telescope keybinds
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope current_buffer_fuzzy_find<cr>


" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup Kal
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END



