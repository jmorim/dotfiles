source $VIMRUNTIME/defaults.vim

set laststatus=2
set encoding=utf-8
"set gfn=Consolas:h11:cANSI:qDRAFT
set guioptions-=m
set guioptions-=T

call plug#begin('$HOME/vimfiles/pluggers')
Plug 'lervag/vimtex'
Plug 'w0rp/ale'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/csv.vim'
call plug#end()

let g:vimtex_view_general_viewer='SumatraPDF'
let g:airline_theme='minimalist'
let g:airline_powerline_fonts=1
set guifont=Source\ Code\ Pro\ for\ Powerline:h10:cANSI
set cc=80
set tw=80
set lines=25 
set columns=90
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set splitbelow
set splitright
set backupdir=~/vimfiles/tmp,.
set directory=~/vimfiles/tmp,.
set undodir=~/vimfiles/tmp,.
syntax enable
colorscheme monokai

aug CSV_Editing
	au!
	au BufRead,BufWritePost *.csv :%ArrangeColumn
	au BufWritePre *.csv :%UnArrangeColumn
aug end
