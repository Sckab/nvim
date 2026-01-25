vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left in insert mode", noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down in insert mode", noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up in insert mode", noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right in insert mode", noremap = true, silent = true })

vim.keymap.set(
	"t",
	"<C-h>",
	"<Cmd>wincmd h<CR>",
	{ desc = "Move in the left window in the terminal", noremap = true, silent = true }
)
vim.keymap.set(
	"t",
	"<C-j>",
	"<Cmd>wincmd j<CR>",
	{ desc = "Move in the bottom window in the terminal", noremap = true, silent = true }
)
vim.keymap.set(
	"t",
	"<C-k>",
	"<Cmd>wincmd k<CR>",
	{ desc = "Move in the upper window in the terminal", noremap = true, silent = true }
)
vim.keymap.set(
	"t",
	"<C-l>",
	"<Cmd>wincmd l<CR>",
	{ desc = "Move in the right window in the terminal", noremap = true, silent = true }
)
vim.keymap.set(
	"t",
	"<Esc><Esc>",
	[[<C-\><C-n>]],
	{ desc = "Put in normal mode the user in terminal mode", noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"<leader>mh",
	"<Cmd>BufferLineMovePrev<CR>",
	{ desc = "Move the current buffer to the left", noremap = false, silent = true }
)

vim.keymap.set(
	"n",
	"<leader>ml",
	"<Cmd>BufferLineMoveNext<CR>",
	{ desc = "Move the current buffer to the right", noremap = false, silent = true }
)

vim.keymap.set("n", "<leader>bc", ":bp | bd #<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>k", "<cmd>Treewalker Up<cr>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>j", "<cmd>Treewalker Down<cr>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>h", "<cmd>Treewalker Left<cr>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>l", "<cmd>Treewalker Right<cr>", { silent = true })

vim.keymap.set("n", "<leader>M", require("treesj").toggle)

vim.keymap.set("n", "<leader>mp", "<Cmd>RenderMarkdown toggle<CR>")

vim.keymap.set("n", "<leader>ccc", "<Cmd>CodeCompanionChat<CR>")
