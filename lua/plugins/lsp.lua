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
                ensure_installed = { "rust_analyzer", "lua_ls", "gopls", "intelephense", "pyright" }
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
                filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue", "json" }
            })
            lsp.intelephense.setup({})
            lsp.gopls.setup({})
            lsp.pyright.setup({})
            lsp.rust_analyzer.setup({})

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
