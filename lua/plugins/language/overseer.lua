return {
	"stevearc/overseer.nvim",
	lazy = false,
	---@module 'overseer'
	---@type overseer.SetupOpts
	opts = {
		task_list = {
			max_height = { 20, 0.2 },
			min_height = 20,
		},
	},
}
