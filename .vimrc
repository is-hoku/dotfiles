set number
imap <Nul> <C-Space>
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set termguicolors
set autoindent
set smartindent
set cindent
syntax on
"set hlsearch
set incsearch
set wildmenu
set t_Co=256
set clipboard=unnamedplus
set shiftwidth=4
set tabstop=4
"let g:airline_theme = 'miramare'
let g:airline_theme = 'sakura'
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:lsp_diagnostics_echo_cursor = 1
set termguicolors
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
Plugin 'VundleVim/Vundle.vim'
" Write Plugins here!
Plugin 'scrooloose/nerdtree'
Plugin 'franbach/miramare'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'sainnhe/everforest'
Plugin 'ryanoasis/vim-devicons'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'is-hoku/sakura'
Plugin 'mattn/vim-goimports'
"Plugin 'fuenor/im_control.vim'

call vundle#end()
"colorscheme miramare
colorscheme sakura

if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif
