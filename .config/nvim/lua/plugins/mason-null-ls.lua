return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufWritePre" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		require("plugins.none-ls")
	end,
}
