-- :nmap for normal mode mappings
-- :vmap for visual mode mappings
-- :imap for insert mode mappings
-- :help map

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "U", vim.cmd.redo)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- buffers
vim.keymap.set("n", "<leader>bc", vim.cmd.bd)
vim.keymap.set("n", "<TAB>", vim.cmd.bnext)
vim.keymap.set("n", "<S-TAB>", vim.cmd.bprevious)

-- lsp
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

-- copilot
vim.keymap.set("i", "<leader><TAB>", 'copilot#Accept("<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

-- copy current file path into system clipboard
vim.keymap.set("n", "<leader>l", ":let @+=expand('%')<CR>")
