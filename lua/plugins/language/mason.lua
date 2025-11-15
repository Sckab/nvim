return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            { "williamboman/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function()
            local navic = require("nvim-navic")
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "astro",
                    "html",
                    "cssls",
                    "ts_ls",
                    "tailwindcss",
                    "csharp_ls",
                    "bashls",
                    "taplo",
                    "jsonls",
                    "lemminx",
                    "marksman",
                    "pyright",
                    "gopls",
                    "clangd",
                },
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {
                                "vim",
                            },
                        },
                    },
                },

                on_attach = function(client, bufnr)
                    navic.attach(client, bufnr)
                end
            })
        end,
    },
}
