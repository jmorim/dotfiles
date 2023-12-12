source $VIMRUNTIME/defaults.vim

set laststatus=2
set encoding=utf-8
set gfn=Consolas:h11:cANSI:qDRAFT
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

set autochdir

let g:plug_timeout=600
call plug#begin('$HOME/vimfiles/pluggers')
Plug 'lervag/vimtex'

function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.py --clang-completer
    endif
endfunction

"Autocomplete plugins. Causing ghost text to show up.
"Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
"Plug 'Valloric/YouCompleteMe'
"
"The two I usually use
""""""""""""""""""""""""""""""""""""""
Plug 'ajh17/VimCompletesMe'
" This one causes problems
"Plug 'vim-scripts/AutoComplPop'
"""""""""""""""""""""""""""""""""""""""
" For R
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'gaalcaras/ncm-R'
"if !has('nvim')
"    Plug 'roxma/vim-hug-neovim-rpc'
"endif
"""""""""""""""""""""""""""""""""""""""

"Plug 'maralla/completor.vim'
Plug 'w0rp/ale'
Plug 'OmniSharp/omnisharp-vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/csv.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'vimwiki/vimwiki', { 'branch': 'dev'}
Plug 'mhinz/vim-startify'
"Plug 'scrooloose/nerdtree'
Plug 'jalvesaq/Nvim-R'
let R_assign=0
Plug 'junegunn/goyo.vim'
Plug 'SirVer/ultisnips'
call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

let g:vimtex_view_general_viewer='SumatraPDF'
let g:airline_theme='minimalist'
let g:airline_powerline_fonts=1
autocmd VimEnter * Limelight
"let g:mkdp_auto_start=1

let g:goyo_width=81
let R_assign=0

"" Wikis
""" wiki_1
let wiki_1 = {}
let wiki_1.index = 'index'
let wiki_1.path= '~/vimwiki'
let wiki_1.ext = 'md'
let wiki_1.syntax = 'markdown'
""" wiki_2
let wiki_2 = {}
let wiki_2.index = 'index'
let wiki_2.path = '~/Documents/research/tea/bicchi collab/Bicchi_Tea/wiki'
let wiki_2.ext = 'md'
let wiki_2.syntax = 'markdown'
""" wiki_3
let wiki_3 = {}
let wiki_3.index = 'index'
let wiki_3.path = '~/Documents/research/tea/LC-MS/Mason_Tea/wiki'
let wiki_3.ext = 'md'
let wiki_3.syntax = 'markdown'
""" wiki_4
let wiki_4 = {}
let wiki_4.index = 'index'
let wiki_4.path = '~/Documents/research/willow/wiki'
let wiki_4.ext = 'md'
let wiki_4.syntax = 'markdown'
""" wiki_5
let wiki_5 = {}
let wiki_5.index = 'index'
let wiki_5.path = '~/Documents/research/prop/brewing/wiki'
let wiki_5.ext = 'md'
let wiki_5.syntax = 'markdown'
""" wiki_6
let wiki_6 = {}
let wiki_6.index = '_index'
let wiki_6.path = '~/Documents/tg/DnD/wiki'
let wiki_6.ext = 'md'
let wiki_6.syntax = 'markdown'
""" wiki_7
let wiki_7 = {}
let wiki_7.index = 'index'
let wiki_7.path = '~/vimwiki/test/markdown/wiki'
let wiki_7.ext = 'md'
let wiki_7.syntax = 'markdown'
""" wiki_8
let wiki_8 = {}
let wiki_8.index = 'index'
let wiki_8.path = '~/vimwiki/test/wiki'

let g:vimwiki_list = [wiki_1, wiki_2, wiki_3, wiki_4, wiki_5, wiki_6, wiki_7, 
            \wiki_8]
"{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
"inoremap <CR> <Esc>:VimwikiReturn 3 5<CR>
"inoremap <S-CR> <Esc>:VimwikiReturn 4 2<CR>
"inoremap <CR> <Esc>:VimwikiReturn 1 5<CR>
"inoremap <S-CR> <Esc>:VimwikiReturn 2 2<CR>

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
set viewdir=~/vimfiles/view
syntax enable
set hlsearch
set smartcase
colorscheme monokai

aug CSV_Editing
	au!
	au BufRead,BufWritePost *.csv :%ArrangeColumn
	au BufWritePre *.csv :%UnArrangeColumn
aug end

aug remember_folds
    au!
    au BufWinLeave *.* mkview
    au BufWinEnter *.* silent loadview
aug END
