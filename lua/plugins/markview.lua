return {
    "OXY2DEV/markview.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("markview").setup({
            preview = {
                enable = false,
                hybrid_mode = true,

                icon_provider = "mini",
            },
        })

        vim.keymap.set("n", "<leader>mp", ":Markview splitToggle<CR>", { desc = "Toggle Markdown Preview" })
    end,
}
