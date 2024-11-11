return {
    "stevearc/oil.nvim",
    config = function()
        local oil = require("oil")
        oil.setup({
            default_file_explorer = true,
            columns = {
                "icon",
                -- "permissions",
                -- "size",
            }
        })
        vim.keymap.set("n", "-", oil.open, {})
    end
}
