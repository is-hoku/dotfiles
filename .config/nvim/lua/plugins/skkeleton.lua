return {
	"vim-skk/skkeleton",
	dependencies = {'vim-denops/denops.vim'},
	config = function()
		vim.fn['skkeleton#config']({
			globalDictionaries = { { '/usr/share/skk/SKK-JISYO.L', 'euc-jp' } },
			eggLikeNewline = true
		})
	end
}
