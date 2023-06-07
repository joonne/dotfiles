vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "U", vim.cmd.redo)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- buffers
vim.keymap.set("n", "<leader>bc", vim.cmd.bd)
vim.keymap.set("n", "<TAB>", vim.cmd.bnext)
vim.keymap.set("n", "<S-TAB>", vim.cmd.bprevious)

-- lsp remaps
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

