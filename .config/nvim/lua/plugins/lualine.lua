return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- ref. https://github.com/glaucus03/dotfiles/blob/main/.vim/lua/plugins/config/lualine.lua#L1-L45
		local function selectionCount()
			local mode = vim.fn.mode()
			local start_line, end_line, start_pos, end_pos
		
			if not (mode:find("[vV\22]") ~= nil) then return "" end
			start_line = vim.fn.line("v")
			end_line = vim.fn.line(".")
		
			if mode == 'V' then
				start_pos = 1
				end_pos = vim.fn.strlen(vim.fn.getline(end_line)) + 1
			else
				start_pos = vim.fn.col("v")
				end_pos = vim.fn.col(".")
			end
		
			local chars = 0
			for i = start_line, end_line do
				local line = vim.fn.getline(i)
				local line_len = vim.fn.strlen(line)
				local s_pos = (i == start_line) and start_pos or 1
				local e_pos = (i == end_line) and end_pos or line_len + 1
				chars = chars + vim.fn.strchars(line:sub(s_pos, e_pos - 1))
			end
		
			local lines = math.abs(end_line - start_line) + 1
			return tostring(lines) .. " lines, " .. tostring(chars) .. " characters"
		end
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = 'auto',
				component_separators = { left = '', right = ''},
				section_separators = { left = '', right = ''},
				disabled_filetypes = {
				  statusline = {},
				  winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
				  statusline = 1000,
				  tabline = 1000,
				  winbar = 1000,
				}
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch', 'diff', 'diagnostics'},
				lualine_c = {'filename'},
				lualine_x = {{selectionCount}, 'encoding', 'fileformat', 'filetype'},
				lualine_y = {'progress'},
				lualine_z = {'location'}
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {'filename'},
				lualine_x = {'location'},
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {}
		})
	end
}
