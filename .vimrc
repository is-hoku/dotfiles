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
let g:airline_theme = 'sakura'
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:lsp_diagnostics_echo_cursor = 1
let mapleader = "\<Space>"
set termguicolors
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nmap <C-k> :LspHover<CR>
nnoremap <expr><c-f> lsp#scroll(+4)
nnoremap <expr><c-d> lsp#scroll(-4)
nmap <C-l> :LspDefinition<CR>
autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
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
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'sebdah/vim-delve'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'vim-scripts/dbext.vim'
Plugin 'vim-skk/eskk.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'kana/vim-operator-user'
Plugin 'dhruvasagar/vim-table-mode'

call vundle#end()
colorscheme sakura

if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif

if executable('rg')
	command! -bang -nargs=* Rg
		\ call fzf#vim#grep(
		\   'rg --line-number --no-heading '.shellescape(<q-args>), 0,
		\   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'up:50%:wrap'))
endif

if filereadable(expand('~/.dbext_profile'))
	source ~/.dbext_profile
endif
let g:dbext_default_history_file = '~/.dbext_history'

command! Jqf %!jq '.'

let g:eskk#directory = "~/.config/eskk"
let g:eskk#dictionary = {'path': "~/.config/eskk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': "~/.config/eskk/SKK-JISYO.LL", 'sorted': 1, 'encoding': 'euc-jp',}
let g:eskk#kakutei_when_unique_candidate = 1
let g:eskk#keep_state = 0
let g:eskk#egg_like_newline = 1

set iminsert=0
set imsearch=0
set imactivatefunc=ImActivate
function! ImActivate(active)
  if a:active
    call system('fcitx-remote -o')
  else
    call system('fcitx-remote -c')
  endif
endfunction
set imstatusfunc=ImStatus
function! ImStatus()
  return system('fcitx-remote')[0] is# '2'
endfunction

let g:table_mode_corner='|'
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
