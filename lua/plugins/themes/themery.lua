return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				{
					name = "Onedark pro",
					colorscheme = "onedark",
					after = [[
                        config = function()
                            require("barbecue").setup({
                                theme = {
                                    normal = { bg = "#1F2329", bold = true },
                                    dirname = { fg = "#E55561" },
                                },
                            })
                        end,
                    ]],
				},
				{
					name = "Kanagawa dragon",
					colorscheme = "kanagawa-dragon",
					after = [[
                        config = function()
                            require("barbecue").setup({
                                theme = {
                                    normal = { bg = "#181616", bold = true },
                                    dirname = { fg = "#FF9E3B" },
                                },
                            })
                        end,
                    ]],
				},
			},
			livePreview = true,
		})
	end,
}
