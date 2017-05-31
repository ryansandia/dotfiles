"set nocompatible
filetype off

" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/,~/.vim/manual_bundle/comment
    call vundle#rc()
    Bundle 'gmarik/vundle'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'vim-airline/vim-airline'
    Bundle 'vim-airline/vim-airline-themes'
    Bundle 'godlygeek/tabular'
    Bundle 'scrooloose/nerdtree'
    Bundle 'vim-scripts/python.vim'
    Bundle 'fs111/pydoc.vim'
    Bundle 'alfredodeza/pytest.vim'
    Bundle 'alfredodeza/khuno.vim'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'vim-scripts/Cpp11-Syntax-Support'
    Bundle 'vim-scripts/taglist.vim'
    Bundle 'ctrlpvim/ctrlp.vim'
    Bundle 'sjl/gundo.vim'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-rsi'
    Bundle 'tpope/vim-dispatch'
    Bundle 'vim-scripts/Tagbar'
    Bundle 'maxbrunsfeld/vim-yankstack'
    Bundle 'Valloric/YouCompleteMe'
    Bundle 'rking/ag.vim'
    Bundle 'PeterRincker/vim-argumentative'
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end


filetype plugin indent on

set t_Co=256

set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set ignorecase
set smartcase
set smarttab
set cindent
set cino=>4
au FileType * setl fo-=cro
syntax on
set incsearch
set nostartofline
set ttyfast
set nocp
set mouse=a
set ttymouse=xterm2
"set mousemodel=extend
set switchbuf=useopen,usetab
set nowrap
set laststatus=2
set cf
"set isk+=_,$,@,%,#, " these are not word separators
set lz " do not redraw during macors
set diffopt+=iwhite
set wildmenu
set wildmode=list:longest
set hidden
set backspace=indent,eol,start
let loaded_matchparen=1
set tabpagemax=25
set scrolloff=3
set timeout timeoutlen=1000 ttimeoutlen=50
"let mapleader="\<Space>"

set encoding=utf-8
let g:airline_theme='solarized'
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#show_message = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" write as root
cnoremap w!! w !sudo dd of=%

" git
nnoremap <leader>gs :Gstatus<CR><C-W>15+

" indent
vnoremap < <gv
vnoremap > >gv

" leader mapping
map <leader>n :NERDTreeToggle<CR>
map <leader>b :TagbarToggle<CR>

" jump to next compile error
:nnoremap <F9> :cn<CR>

" no ex mode
nnoremap Q <nop>

" pasting
map <F11> :set paste<CR>i
imap <F11> <ESC>:set paste<CR>i<Right>
au InsertLeave * set nopaste

" toggle background for solarized
set background=dark
call togglebg#map("<F2>")

" search highlighting
nnoremap <silent> <F10> :set invhls<CR>:exec "let @/='\\<".expand("<cword>")."\\>'"<CR>

" buffer switching
:nnoremap <F5> :buffers<CR>:buffer<Space>

" undo list
:nnoremap <F6> :GundoToggle<CR>

" end function keys

" Navigation mapping
nnoremap ' `
nnoremap ` '
map <A-DOWN> gj
map <A-UP> gk
imap <A-UP> <ESC>gki
imap <A-DOWN> <ESC>gji
noremap - <PageDown>
noremap = <PageUp>

" Tab keyboard mapping
:nmap<C-h> :tabprevious<cr>
:nmap<C-l>  :tabnext<cr>
:map<C-l> :tabprevious<cr>
:map<C-h>  :tabnext<cr>

" Automatically open source or header for a file
:nmap ,s :tabf %:t:r.cpp<cr>
:nmap ,h :tabf %:t:r.h<cr>

:map <C-d> :sh<cr>
:nmap ,t <ESC>:tabnew 
:nmap <leader>t <ESC>:TlistToggle<cr>

"autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
"autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"autocmd BufRead *.py nmap <F8> :wa<cr>:!python %<CR>

" Eliminate trailing whitespace on source files
autocmd BufWritePre *.sh :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.lua :%s/\s\+$//e
autocmd BufWritePre *.cpp :%s/\s\+$//e
autocmd BufWritePre *.hpp :%s/\s\+$//e
autocmd BufWritePre *.java :%s/\s\+$//e

" Folding
set foldmethod=indent
set foldlevel=99

set backupdir=/var/tmp
set directory=/var/tmp

" ctrl-p mappings
" https://github.com/kien/ctrlp.vim
let g:ctrlp_map = "<c-p>"
let g:ctrlp_cmd = "CtrlPMixed"
let g:ctrlp_working_path_mode = 2
set wildignore+=*.o,.git,*.a,*.so,*/build/*,*/tps/*,*/cmake/*,*.cmake

colorscheme solarized
let g:solarized_termtrans=1

set relativenumber
set number

set autoindent
set undodir=/tmp

" Taglist
let Tlist_Use_Single_Click=1
let Tlist_Display_Prototype=1
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=70
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"

" Yankstack
nmap Y y$
nmap <C-r> <Plug>yankstack_substitute_older_paste
nmap <C-f> <Plug>yankstack_substitute_newer_paste

" Ultisnips
let g:UltiSnipsSnippetDirectories=["snippets"]

" khuno
let g:khuno_builtins="_,apply"
let g:khuno_max_line_length=999
nmap <silent><Leader>x <Esc>:Khuno show<CR>

augroup vim_config
    autocmd FileType gitrebase call LoadGitrebaseBindings()
augroup END

fun! LoadGitrebaseBindings()
    nnoremap  P :Pick<CR>
    nnoremap  S :Squash<CR>
    nnoremap  F :Fixup<CR>
    nnoremap  C :Cycle<CR>
endfun

" easymotion
let g:EasyMotion_leader_key = '<Space>'
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Love me some emacs-style shortcuts
inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

let g:ycm_global_ycm_extra_conf = '/Users/rlong/.dotfiles/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
