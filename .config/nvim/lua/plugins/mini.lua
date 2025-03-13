return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.surround").setup()
		local map = require("mini.map")
		vim.api.nvim_create_autocmd("BufReadPost", {
			callback = function()
				require("mini.map").open()
			end
		})
		map.setup({
			-- Highlight integrations (none by default)
			integrations = {
				map.gen_integration.builtin_search(),
				map.gen_integration.diff(),
				map.gen_integration.diagnostic(),
			},

			-- Symbols used to display data
			symbols = {
				-- Encode symbols. See `:h MiniMap.config` for specification and
				-- `:h MiniMap.gen_encode_symbols` for pre-built ones.
				-- Default: solid blocks with 3x2 resolution.
				encode = nil,

				-- Scrollbar parts for view and line. Use empty string to disable any.
				scroll_line = '█',
				scroll_view = '┃',
			},

			-- Window options
			window = {
				-- Whether window is focusable in normal way (with `wincmd` or mouse)
				focusable = false,

				-- Side to stick ('left' or 'right')
				side = 'right',

				-- Whether to show count of multiple integration highlights
				show_integration_count = true,

				-- Total width
				width = 10,

				-- Value of 'winblend' option
				winblend = 10,

				-- Z-index
				zindex = 10,
			},
		})
		local is_minimap_open = true
		local function toggleMinimap()
			if is_minimap_open then
				map.close()
			else
				map.open()
			end
			is_minimap_open = not is_minimap_open
		end
		vim.keymap.set('n', 'm', toggleMinimap, { noremap = true, silent = true })
	end
}
