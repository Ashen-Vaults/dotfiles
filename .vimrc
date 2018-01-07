set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'

Bundle 'nvie/vim-flake8'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'Valloric/YouCompleteMe'
Bundle 'python-mode/python-mode'
"Bundle 'vim-autopep8'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"Shows Powerline all the time
set laststatus=2

"Display numbers
set number
set relativenumber
set nu

"Splitting Options
set splitbelow
set splitright


"split navigations
nnoremap <C-J> <C-W><C-J> " move split below
nnoremap <C-K> <C-W><C-K> " move split above
nnoremap <C-L> <C-W><C-L> " move split right
nnoremap <C-H> <C-W><C-H> " move split left


" Enable Folding
set foldmethod=indent
set foldlevel=99

" Enable foldin with spacebar
"Plugin 'nvie/vim-flake8'
nnoremap <space> za

inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

" Stop swp files
set noswapfile

" docstrings folding
let g:SimpylFold_docstring_preview=1

" enable all python syntax highighting features
let python_highlight_all=1
syntax on
syntax enable

" Show a visual line under currentline
set cursorline

" Show the matching part of the pair for [] {} ()
set showmatch

if has('gui_running')
  set background=dark
  colorscheme zenburn
else
  set background=dark
  colorscheme space-vim-dark 
endif

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |


highlight BadWhitespace ctermbg=red guibg=darkred

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"pymode
let g:pymode_python = 'python3'

"Flake 8
"let g:flake8_show_in_gutter=1
"autocmd BufWritePost *.py call Flake8()

" Automatically fix PEP8 errors in the current buffer:
noremap <F8> :PymodeLintAuto<CR>

"let g:pymode_lint_on_write = 0

call pymode#default("g:pymode_options_max_line_length", 80)

"call flake8#Flake8UnplaceMarkers()

"call togglebg#map("<F5>")

" Virtualenv support
 py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'),
  dict(__file__=activate_this))
EOF


" Clipboard
set clipboard=unnamed

" Vim in the shell
" set editing-mode vi



