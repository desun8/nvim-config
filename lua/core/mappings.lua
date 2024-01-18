vim.g.mapleader = " " -- Space

-- Open current directory
vim.keymap.set("n", "<leader>e", ":NvimTreeOpen <CR>")
-- Buffer nav
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-q>", ":Bdelete<CR>", { noremap = true, silent = true })
-- Terminal
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")
vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>")
vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical size=40<CR>")

-- Git
vim.keymap.set("n", "<leader>gg", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>")
