set number
imap <Nul> <Nop>
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set termguicolors
set autoindent
set smartindent
set cindent
syntax on
set t_Co=256
let g:airline_theme = 'miramare'
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

call vundle#end()

colorscheme miramare
