return {
    {
        "hrsh7th/nvim-cmp",
        config = function()
           local cmp = require("cmp")
            cmp.setup({
                snippet = {},
                window = {},
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                }, {
                    { name = "buffer" }
                })
            })
        end
    },
    {
        "hrsh7th/cmp-nvim-lsp",
    }
}
