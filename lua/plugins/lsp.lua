return {
    {
        "williamboman/mason.nvim",
        config = function()
            local mason = require("mason")
            mason.setup({})
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local mason = require("mason-lspconfig")
            mason.setup({
                ensure_installed = { "lua_ls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            local lsp = require("lspconfig")
            lsp.lua_ls.setup({})
            lsp.volar.setup({})
            lsp.tsserver.setup({
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = os.getenv("NODE_HOME") .. "/bin/vue-language-server",
                            languages = { "vue" }
                        }
                    }
                },
                filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" }
            })

            -- Keymaps
            vim.keymap.set("n", "<leader>ca", function()
                vim.lsp.buf.code_action({ apply = true })
            end)
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, {})
            vim.keymap.set("n", "F", function()
                vim.lsp.buf.format()
            end)
        end
    },
}
