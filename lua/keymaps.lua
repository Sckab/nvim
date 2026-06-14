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

vim.keymap.set("n", "<leader>gdc", "<Cmd>DiffviewClose<CR>", { desc = "Close the diffview buffer" })

vim.keymap.set("n", "<leader>lr", "<Cmd>Leet run<CR>", { desc = "Run the code in the leetcode plugin interface" })
vim.keymap.set("n", "<leader>ls", "<Cmd>Leet submit<CR>", { desc = "Submit the code in the leetcode plugin interface" })

-- ╭──────────╮
-- │ GRUG FAR │
-- ╰──────────╯
vim.keymap.set("n", "<leader>gf", "<Cmd>GrugFar<CR>", { desc = "Opens grug far" })

-- ╭─────────────╮
-- │ COMMENT BOX │
-- ╰─────────────╯
vim.keymap.set({ "n", "v" }, "<leader>cb", "<Cmd>CBllbox1<CR>", { desc = "Creates a comment box" })
vim.keymap.set({ "n", "v" }, "<leader>cl", "<Cmd>CBllline1<CR>", { desc = "Creates a comment line" })
vim.keymap.set({ "n", "v" }, "<leader>cq", "<Cmd>CBllbox12<CR>", { desc = "Creates a comment quote" })

-- ╭─────╮
-- │ DAP │
-- ╰─────╯
vim.keymap.set("n", "<leader>du", function()
	require("dapui").toggle()
end, { desc = "Toggle the DAP UI" })
vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", function()
	require("dap").continue()
end, { desc = "Continue" })
vim.keymap.set("n", "<leader>dsi", function()
	require("dap").step_into()
end, { desc = "Step Into" })
vim.keymap.set("n", "<leader>dso", function()
	require("dap").step_over()
end, { desc = "Step Over" })

-- ╭──────╮
-- │ DIAL │
-- ╰──────╯
vim.keymap.set("n", "<C-a>", function()
	require("dial.map").manipulate("increment", "normal")
end, { desc = "Increment" })
vim.keymap.set("n", "<C-x>", function()
	require("dial.map").manipulate("decrement", "normal")
end, { desc = "Decrement" })
vim.keymap.set("v", "<C-a>", function()
	require("dial.map").manipulate("increment", "visual")
end, { desc = "Increment" })
vim.keymap.set("v", "<C-x>", function()
	require("dial.map").manipulate("decrement", "visual")
end, { desc = "Decrement" })
