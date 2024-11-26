return {
	"Shougo/ddc.vim",
	dependencies = {'vim-denops/denops.vim', 'vim-skk/skkeleton', 'Shougo/ddc-source-lsp', 'LumaKernel/ddc-source-file' },
	config = function()
		vim.fn['ddc#custom#patch_global']('sources', { 'skkeleton', 'lsp', 'file' })
		vim.fn['ddc#custom#patch_global']('sourceOptions', {
			skkeleton = {
				mark = '[skkeleton]',
				matchers = {},
				sorters = {},
				converters = {},
				isVolatile = true,
				minAutoCompleteLength = 1,
			},
			lsp = {
				mark = '[LSP]',
				forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
			},
			file = {
				mark = '[File]',
				isVolatile = true,
				forceCompletionPattern = [[\S/\S*]],
			},
		})
		vim.fn['ddc#custom#patch_global']('sourceParams', {
			lsp = {
				snippetEngine = vim.fn["denops#callback#register"](function(body) return vim.fn["vsnip#anonymous"](body) end),
				enableResolveItem = true,
				enableAdditionalTextEdit = true,
			},
		})
		vim.fn['ddc#enable']()
		vim.fn['ddc#custom#patch_global']('ui', 'pum')
	end
}
