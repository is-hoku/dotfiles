set number
imap <Nul> <C-Space>
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set termguicolors
set autoindent
set smartindent
set cindent
syntax on
set t_Co=256
set clipboard=unnamed
set shiftwidth=4
set tabstop=4
"let g:airline_theme = 'miramare'
let g:airline_theme = 'sakura'
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
"map <C-c> "+y
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
Plugin 'nono-n1i/sakura'
"Plugin 'fuenor/im_control.vim'

call vundle#end()
"colorscheme miramare
colorscheme sakura
