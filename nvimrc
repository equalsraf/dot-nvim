" Fish is not a POSIX shell
if $SHELL =~ 'bin/fish'
	set shell=/bin/sh
endif

call plug#begin(fnamemodify($MYVIMRC, ':p:h') . '/plugged')
" Make sure you use single quotes
Plug 'bling/vim-airline'
Plug 'cschlueter/vim-wombat'
Plug 'fmoralesc/vim-pad'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/unite.vim'
Plug 'benekastah/neomake'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rust-lang/rust.vim'
call plug#end()

" WTF
set bs=indent,eol,start

let mapleader = " "			" <space> is the Leader - put this in before the plugins

filetype plugin indent on    " required

" Enable the clipboard
set clipboard+=unnamedplus

" vim-pad
let pad#dir="~/Documents/Notes"
let pad#window_height=16
let pad#open_in_split=0
let pad#position="right"
let pad#default_format = "markdown"
let pad#rename_files=0
let pad#name_format="%Y-%m-%d-{default}"
"let pad#search_backend="ack"
let pad#ignore_files="*.jpg"

syntax on				" Syntax hightlight is On
set autoindent				" cursor at the same indent as line above
set ruler
set noerrorbells			" don't whine
set novisualbell			" No epileptic attacks please
set shortmess=atI			" shorten messages and don't show intro
set wildmenu
set wildmode=list:longest,full		" set wildmode to list full
set cul					" highlight line under cursor
set laststatus=2			" Always show statusline
set wildignore=*.swp,*.pyc,*.class,*.o,*.moc
set wildignorecase
set hidden
set mouse=a
set nofoldenable			" I hate folding with a passion
set title

" Default indentation goes like this
set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

" Portuguese users may prefer to use ç instead of :
nnoremap ç :

" Disable arrow keys - Real men don't use the arrow keys
nnoremap  <Up> ""
nnoremap  <Down> ""
nnoremap  <Left> ""
nnoremap  <Right> ""

" Avoid Ex mode
nnoremap Q <nop>

" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" ------------ Text edit/search
set hlsearch				" highlight search results
set incsearch				" search as we type
set ignorecase				" set case insensitive
set smartcase				" unless there is a capital letter
set completeopt=longest,menuone

set bg=dark
set t_Co=256
color wombat256

" powerline fonts :D 
let g:airline_powerline_fonts = 1

let g:local_vimrc = {'names':['localvimrc'],'hash_fun':'LVRHashOfFile'}

" --------- File types
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType rust setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType html,javascript,css setlocal tabstop=4 shiftwidth=4 softtabstop=4
au BufNewFile,BufRead *.md set filetype=markdown

" --------- Some mappings
set pastetoggle=<F2>	" F2 toggles the paste mode

" Dont use Tabs use buffers

" To open a new empty buffer
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>


" Move lines up/down with Alt+hjkl keys
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

" j/k Jump to the next line - but since I like long wrapped lines
" they should jump to the next ROW
nnoremap j gj
nnoremap k gk

" ------------- Airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


" Unite
nnoremap <Leader>f :Unite -start-insert file<CR>
nnoremap <C-p> :Unite -start-insert file_rec<CR>

" Ultisnips
let g:UltiSnipsExpandTrigger="<S-Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" ------------- EXPERIMENTAL

" Get our hostname
function! Hostname()
	"
	" 1. First we try to get the $HOST variable
	" 2. IF $HOST does not exist call !hostname
	let hostname = $HOST
	if hostname != ""
		return hostname
	endif

	let hostname = system('hostname')
	return hostname
endfunction

"
" Toggle (EN -> PT -> Disabled) spell by pressing F4
"
function! SwitchSpellcheck()
	if ! &spell
		setlocal spell spelllang=en
	elseif  &spelllang == "en"
		setlocal spell spelllang=pt
	else
		setlocal spelllang=en
		set nospell
	endif
endfunction
map <F4> :call SwitchSpellcheck()<CR>

