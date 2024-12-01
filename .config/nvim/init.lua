require("config.lazy")

vim.opt.number = true
vim.opt.list = true
vim.opt.listchars = { tab = '»-', trail = '-', eol = '↲', extends = '»', precedes = '«', nbsp = '%' }
vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 100
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undo")
vim.opt.undofile = true

if vim.fn.has("mac") == 1 then
	vim.opt.clipboard = "unnamed"
	vim.opt.directory = vim.fn.expand("~/.cache/vim/swap")
else
	vim.opt.clipboard = "unnamedplus"
end

vim.g.mapleader = " "
vim.g.airline_theme = 'sakura'
vim.cmd("colorscheme sakura")

vim.keymap.set('i', '<C-Space>', '<Nul>')
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<Esc><Esc>', ':nohl<CR>')
vim.keymap.set('i', '<C-n>', '<Cmd>call pum#map#insert_relative(+1)<CR>', { silent = true })
vim.keymap.set('i', '<C-p>', '<Cmd>call pum#map#insert_relative(-1)<CR>', { silent = true })
vim.keymap.set('i', '<CR>', function()
		if vim.fn["pum#visible"]() == true then
			return "<Cmd>call pum#map#confirm()<CR>"
		else
			return "<CR>"
		end
	end,
	{ expr = true })

vim.opt.iminsert = 0
vim.opt.imsearch = 0

function ImActivate(active)
	if active then
		vim.fn.system('fcitx5-remote -o')
	else
		vim.fn.system('fcitx5-remote -c')
	end
end

function ImStatus()
	return vim.fn.system('fcitx5-remote'):sub(1, 1) == '2'
end

vim.keymap.set('i', '<C-j>', '<Plug>(skkeleton-enable)', { noremap = false, silent = true })
vim.keymap.set('c', '<C-j>', '<Plug>(skkeleton-enable)', { noremap = false, silent = true })
