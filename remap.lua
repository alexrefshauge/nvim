vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>o", vim.cmd.Ex)

-- move line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'")

-- splits
vim.keymap.set("n", "<leader>sj", function() vim.api.nvim_open_win(0, true, {split = 'below'}) end)
vim.keymap.set("n", "<leader>sk", function() vim.api.nvim_open_win(0, true, {split = 'above'}) end)
vim.keymap.set("n", "<leader>sl", function() vim.api.nvim_open_win(0, true, {split = 'right'}) end)
vim.keymap.set("n", "<leader>sh", function() vim.api.nvim_open_win(0, true, {split = 'left'}) end)

