return {
	"vim-skk/skkeleton",
	dependencies = { 'vim-denops/denops.vim' },
	config = function()
		vim.fn['skkeleton#config']({
			globalDictionaries = {
				{ '/usr/share/skk/SKK-JISYO.L',          'euc-jp' },
				{ '/usr/share/skk/SKK-JISYO.propernoun', 'euc-jp' },
				{ '/usr/share/skk/SKK-JISYO.jinmei',     'euc-jp' },
				{ '/usr/share/skk/SKK-JISYO.geo',        'euc-jp' },
				{ '/usr/share/skk/SKK-JISYO.fullname',   'euc-jp' },
				{ '/usr/share/skk/SKK-JISYO.station',    'euc-jp' },
				{ '/usr/share/skk/SKK-JISYO.law',        'euc-jp' },
				{ '/usr/share/skk/SKK-JISYO.assoc',      'euc-jp' },
				{ '/usr/share/skk/SKK-JISYO.JIS2',       'euc-jp' },
				{ '/usr/share/skk/SKK-JISYO.JIS3_4',     'euc-jp' },
				{ '/usr/share/skk/SKK-JISYO.JIS2004',    'euc-jp' },
				{ '/usr/share/skk/SKK-JISYO.mazegaki',   'euc-jp' },
				{ '/usr/share/skk/SKK-JISYO.itaiji',     'euc-jp' },
				{ '/usr/share/skk/SKK-JISYO.lisp',       'euc-jp' },
				{ '/usr/share/skk/SKK-JISYO.wrong',      'euc-jp' },
				{ '/usr/share/skk/SKK-JISYO.requested',  'euc-jp' },
			},
			eggLikeNewline = true,
		})
		vim.fn['skkeleton#register_kanatable']('rom', {
			[','] = { '，' },
			['.'] = { '．' },
		})
	end
}
