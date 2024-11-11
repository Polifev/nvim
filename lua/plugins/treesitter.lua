return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = { "rust", "lua", "go", "vue", "html", "css", "javascript", "typescript", "php", "go" },
                highlight = {
                    enable = true
                }
            })
        end
    }
}
