-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Автоматически выравнивать окна при изменении размера терминала
vim.api.nvim_create_autocmd("VimResized", {
	desc = "Resize splits proportionally when terminal is resized",
	group = vim.api.nvim_create_augroup("resize-splits", { clear = true }),
	callback = function()
		vim.cmd("wincmd =")
	end,
})

-- Перезагрузка конфига после изменения
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = vim.fn.expand('~/.config/nvim') .. '/**/*.lua',
  callback = function(args)
    dofile(args.file)
    vim.notify('Config reloaded: ' .. vim.fn.fnamemodify(args.file, ':t'), vim.log.levels.INFO)
  end,
})

