-- return {
--     {
--         "L3MON4D3/LuaSnip",
--         dependencies = { "rafamadriz/friendly-snippets" },
--         config = function()
--             require("luasnip.loaders.from_vscode").lazy_load()
--         end,
--     },
--     {
--         'saghen/blink.cmp',
--         dependencies = { 'rafamadriz/friendly-snippets' },
--
--         version = '1.*',
--
--         build = 'cargo build --release',
--
--         ---@module 'blink.cmp'
--         ---@type blink.cmp.Config
--         opts = {
--             keymap = { preset = 'super-tab' },
--
--             signature = { enabled = true },
--
--             appearance = {
--                 nerd_font_variant = 'normal'
--             },
--
--             completion = { documentation = { auto_show = true } },
--
--             sources = {
--                 default = { 'lsp', 'path', 'snippets', 'buffer' },
--             },
--
--             fuzzy = { implementation = "prefer_rust_with_warning" },
--         },
--         opts_extend = { "sources.default" },
--     },
--     {
--         "rafamadriz/friendly-snippets",
--         lazy = true,
--     },
-- }

return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
            "brenoprata10/nvim-highlight-colors",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = {
                        border = "none",
                    },
                    documentation = {
                        border = "none",
                    },
                },

                experimental = {
                    ghost_text = true,
                },

                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        ellipsis_char = "...",
                    }),
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),

                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-j>"] = cmp.mapping.scroll_docs(4),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-k>"] = cmp.mapping.scroll_docs(-4),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if entry then
                                cmp.confirm({ select = true })
                            else
                                cmp.select_next_item()
                            end
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "nvim_lua" },
                    { name = "cmdline" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "spell" },
                    { name = "highlight_colors" },
                }),
            })
        end,
    },
}
