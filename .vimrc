set number
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
imap <Nul> <C-Space>
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set termguicolors
set autoindent
set smartindent
set cindent
syntax on
filetype plugin on
filetype indent on
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildmenu
set wildignorecase
set t_Co=256
if has('mac')
	set clipboard=unnamed
	set directory=~/.cache/vim/swap
else
	set clipboard=unnamedplus
endif
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
nmap gj gj<SID>g
nmap gk gk<SID>g
nnoremap <script> <SID>gj gj<SID>g
nnoremap <script> <SID>gk gk<SID>g
nmap <SID>g <Nop>
nmap <C-k> :LspHover<CR>
nnoremap <expr><Leader>j lsp#scroll(+4)
nnoremap <expr><Leader>k lsp#scroll(-4)
nmap <C-l> :LspDefinition<CR>
nmap <C-j> :LspReferences<CR>
autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
command! Jqf %!jq '.'
autocmd BufWritePost *.json Jqf
autocmd BufWritePost *.java :silent! %!google-java-format -
nmap <Esc><Esc> :nohl<CR>
autocmd QuickFixCmdPost *grep* cwindow
autocmd QuickFixCmdPost *make* cwindow

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree' |
		\ Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
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
Plugin 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'
Plugin 'hashivim/vim-terraform'
Plugin 'mhinz/vim-rfc'
Plugin 'xavierchow/vim-swagger-preview'
Plugin 'weirongxu/plantuml-previewer.vim'
Plugin 'tyru/open-browser.vim'
Plugin 'aklt/plantuml-syntax'
Plugin 'mbbill/undotree'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'ujihisa/neco-look'
Plugin 'rhysd/committia.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/vim-qfedit'
Plugin 'machakann/vim-sandwich'

call vundle#end()
colorscheme sakura

if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif

" Xuyuanp/nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
	\ 'Modified'  :'✹',
	\ 'Staged'	  :'✚',
	\ 'Untracked' :'✭',
	\ 'Renamed'   :'➜',
	\ 'Unmerged'  :'═',
	\ 'Deleted'   :'✖',
	\ 'Dirty'	  :'✗',
	\ 'Ignored'   :'☒',
	\ 'Clean'	  :'✔︎',
	\ 'Unknown'   :'?',
	\ }
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 1

" prabirshrestha/vim-lsp
let g:lsp_diagnostics_virtual_text_enabled = 0

" junegunn/fzf junegunn/fzf.vim
if executable('rg')
	command! -bang -nargs=* Rg
		\ call fzf#vim#grep(
		\ 'rg --line-number --no-heading '.shellescape(<q-args>), 0,
		\ fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'up:50%:wrap'))
endif

" vim-scripts/dbext.vim
if filereadable(expand('~/.dbext_profile'))
	source ~/.dbext_profile
endif
let g:dbext_default_history_file = '~/.dbext_history'

" vim-skk/eskk.vim
let g:eskk#directory = "~/.config/eskk"
let g:eskk#dictionary = {'path': "~/.config/eskk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': "~/.config/eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}
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

" dhruvasagar/vim-table-mode
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

" prettier/vim-prettier
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat = 1

" hhatto/autopep8
"let g:autopep8_on_save = 1
autocmd BufWritePost *.py :silent! %!autopep8 -
" nvie/vim-flake8
autocmd BufWritePost *.py call flake8#Flake8()

" hashivim/vim-terraform
let g:terraform_binary_path = '/usr/bin/terraform'
"let g:terraform_fmt_on_save = 1
autocmd BufWritePost *.tf call terraform#fmt()

" mbbill/undotree
nnoremap <C-p> :UndotreeToggle<CR>

" merlin
let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" ocp-indent
set rtp^="/home/hoku/.opam/4.14.0/share/ocp-indent/vim"

function! s:ocaml_format()
	let now_line = line('.')
	exec ':%! ocp-indent'
	exec ':' . now_line
endfunction

augroup ocaml_format
	autocmd!
	autocmd BufWrite,FileWritePre,FileAppendPre *.mli\= call s:ocaml_format()
augroup END

" spell check in commit messages
augroup GitSpellCheck
    autocmd!
    autocmd FileType gitcommit setlocal spell
augroup END

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
\ 'gitcommit': ['look'],
\})
call deoplete#custom#option({
\ 'auto_complete': v:false,
\})

" rhysd/committia.vim
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell
    setlocal spelllang+=cjk

    " If no commit message, start with insert mode
    " if a:info.vcs ==# 'git' && getline(1) ==# ''
    "     startinsert
    " end

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-p>
    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

" nathanaelkane/vim-indent-guides
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4


" airblade/vim-gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_map_keys = 0
let g:gitgutter_set_sign_backgrounds=1
set signcolumn=yes
set updatetime=100
