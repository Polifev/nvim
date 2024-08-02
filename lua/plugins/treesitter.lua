return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = { "lua", "go", "vue", "html", "css", "javascript", "typescript" },
                highlight = {
                    enable = true
                }
            })
        end
    }
}
