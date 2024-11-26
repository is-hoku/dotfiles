return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local telescope = require("telescope")
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<C-g>', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<C-f>', function() telescope.extensions.frecency.frecency() end, { desc = 'Telescope frecency' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
		telescope.setup({
			defaults = {
				find_command = {
					"fd",
					"--type=file",
					"--follow",
					"--hidden",
					"--exclude=.git",
					"--exclude=.cache",
					"--exclude=node_modules",
				},
				vimgrep_arguments = {
					"rg",
					"--hidden",
					"--smart-case",
					"--follow",
					"--column",
					"--line-number",
					"--with-filename",
					"--color=never",
					"--no-heading",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					follow = true,
				},
			},
		})
	end
}
