" Fish is not a POSIX shell
if $SHELL =~ 'bin/fish'
	set shell=/bin/sh
endif

" Dein
if has('win32')
	let dein_path=expand('~/Appdata/Local/nvim/dein.vim')
	let dein_plugin_path=('~/Appdata/Local/nvim/plugins')
else
	let dein_path=expand('~/.config/nvim/dein.vim')
	let dein_plugin_path=('~/.config/nvim/plugins')
endif
let &runtimepath.=','.expand(dein_path)
if dein#load_state(dein_plugin_path)
	call dein#begin(dein_plugin_path)

	call dein#add(dein_path)
	call dein#add('haya14busa/dein-command.vim')
	call dein#add('rust-lang/rust.vim')
	call dein#add('majutsushi/tagbar')
	call dein#add('neomake/neomake')
	call dein#add('cschlueter/vim-wombat')
	call dein#add('jremmen/vim-ripgrep')
	call dein#add('tpope/vim-fugitive')
	call dein#add('Chiel92/vim-autoformat')
	call dein#add('mrk21/yaml-vim')
	call dein#add('rust-lang/rust.vim')
	call dein#add('rhysd/committia.vim')
	call dein#add('fmoralesc/vim-pad')
	call dein#add('MarcWeber/vim-addon-local-vimrc')
	"call dein#add('equalsraf/neovim-gui-shim')
	"call dein#add('')

	call dein#end()
	call dein#save_state()
endif

let mapleader = " "				" <space> is the Leader - put this in before the plugins

filetype plugin indent on		" required

" Enable the clipboard
set clipboard+=unnamedplus

" vim-pad
let pad#dir="~/Documents/Notes"
let pad#window_height=16
let pad#open_in_split=0
let pad#position="right"
let pad#default_format = "markdown"
let pad#rename_files=0
let pad#search_backend="ag"
let pad#ignore_files="*.jpg"

syntax on					" Syntax hightlight is On
set autoindent				" cursor at the same indent as line above
set noerrorbells			" don't whine
set novisualbell			" No epileptic attacks please
set shortmess=atI			" shorten messages and don't show intro
set wildmenu
set wildmode=list:longest,full		" set wildmode to list full
set laststatus=2			" Always show statusline
set wildignore=*.swp,*.pyc,*.class,*.o,*.moc
set wildignorecase
set hidden
set mouse=a
set nofoldenable			" I hate folding with a passion
set title

" Default indentation goes like this
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" Portuguese users may prefer to use ç instead of :
"nnoremap ç :

" Disable arrow keys - Real men don't use the arrow keys
nnoremap  <Up> ""
nnoremap  <Down> ""
nnoremap  <Left> ""
nnoremap  <Right> ""

" Avoid Ex mode
nnoremap Q <nop>

" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <C-j> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")

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

" Neomake: open quickfix by default
let g:neomake_open_list=2

" --------- File types
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType rust
	\ setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 |
	\ let g:neomake_enabled_makers = ['cargo']
au FileType html,javascript,css setlocal tabstop=4 shiftwidth=4 softtabstop=4
au BufNewFile,BufRead *.md set filetype=markdown
au FileType markdown setlocal wrap linebreak nolist
au BufRead,BufNewFile *.ts setlocal filetype=typescript
" Tex - show breaks, disable cul, scroll one line at a time
au FileType tex setlocal wrap linebreak showbreak=.. nocul scroll=1

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
" Discard buffer
nmap <leader>bx :bp <BAR> bd! #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" j/k Jump to the next line - but since I like long wrapped lines
" they should jump to the next ROW
nnoremap j gj
nnoremap k gk

" Leave terminal with Escape
tnoremap <Esc> <C-\><C-n>
let g:terminal_scrollback_buffer_size = 10000

" vim-autoformat
let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']

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

" LocalLeader-o add a new line starting with a timestamp
au FileType markdown map <LocalLeader>o o<C-R>=strftime("%a %d-%m-%Y %I:%M%p: ")<CR>

