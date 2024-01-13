return {
    "neovim/nvim-lspconfig",
    build = ":MasonUpdate",

    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "Hoffs/omnisharp-extended-lsp.nvim",
    },

    config = function()
        local lspconfig = require("lspconfig")

        -- needed for cssls
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        -- keybinds
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "gr", vim.lsp.buf.references)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
        vim.keymap.set("n", "K", vim.lsp.buf.hover)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
        vim.keymap.set("n", "H", vim.lsp.buf.signature_help)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "H", vim.diagnostic.open_float)

        -- icons for mason
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- ensure language servers and setup handlers
        require("mason-lspconfig").setup({
            ensure_installed = {
                "bashls",
                "cssls",
                "html",
                "jsonls",
                "lua_ls",
                "omnisharp",
                "pyright",
                "tsserver",
                "vimls",
            },

            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({})
                end,

                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                            },
                        },
                    })
                end,
                ["cssls"] = function()
                    lspconfig.cssls.setup({
                        capabilities = capabilities,
                    })
                end,
                ["omnisharp"] = function()
                    lspconfig.omnisharp.setup({
                        handlers = {
                            ["textDocument/definition"] = require("omnisharp_extended").handler,
                        },
                        cmd = { "omnisharp", "--languageserver" },
                    })
                end,
            },
        })

        -- open mason
        vim.keymap.set("n", "<leader>m", ":Mason<CR>")
    end,
}
