local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>af', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>rg', builtin.registers)
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions)
vim.keymap.set('n', '<leader>gr', builtin.lsp_references)
vim.keymap.set('n', '<leader>ss', builtin.git_status)
vim.keymap.set('n', '<leader>cs', builtin.git_commits)

require("telescope").load_extension("flutter")
