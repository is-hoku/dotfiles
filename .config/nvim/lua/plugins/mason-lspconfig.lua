return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { 'neovim/nvim-lspconfig' },
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls" },
			automatic_installation = true,
		})

		local lspconfig = require("lspconfig")
		vim.diagnostic.config({
			virtual_text = false,
			signs = true,
			underline = true,
			float = { border = "rounded" },
		})
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					on_attach = function(client, bufnr)
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format { async = false }
							end
						})
						local opts = { noremap = true, silent = true, buffer = bufnr }
						vim.keymap.set("n", "<C-l>", vim.lsp.buf.definition, opts)
						vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, opts)
						vim.keymap.set("n", "<C-j>", vim.lsp.buf.references, opts)
						vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
							border = "rounded",
						})
					end,
					capabilities = require("ddc_source_lsp").make_client_capabilities(),
				})
			end,
		})
	end,
}
