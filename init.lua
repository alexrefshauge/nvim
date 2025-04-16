require("alexref.remap")
require("alexref.lazy_init")

local augroup = vim.api.nvim_create_augroup
local AlexRefGroup = augroup('AlexRef', {}) 


vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
-- vim.opt.colorcolumn = "80"
local autocmd = vim.api.nvim_create_autocmd
autocmd('LspAttach', {
	group = AlexRefGroup,
	callback = function(e) 
		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n","K", function() vim.lsp.buf.hover() end, opts)
	end
})

vim.diagnostic.enable(true)
vim.cmd("colorscheme cyberdream")
