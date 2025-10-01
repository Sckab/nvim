vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left in insert mode", noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down in insert mode", noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up in insert mode", noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right in insert mode", noremap = true, silent = true })

vim.keymap.set("n", "<leader>bc", ":bp | bd #<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "za", "za")
vim.keymap.set("n", "zR", "zR")
vim.keymap.set("n", "zM", "zM")

vim.keymap.set("n", "P", "$", { noremap = true, silent = true })
vim.keymap.set("n", "N", "0", { noremap = true, silent = true })
