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

        -- change directory to root of project
        local on_attach = function(client)
            local root_dir = client.config.root_dir
            vim.cmd("cd " .. root_dir)
        end

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
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)
        vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end)

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
                    lspconfig[server_name].setup({
                        on_attach = on_attach,
                    })
                end,

                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        on_attach = on_attach,
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
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end,
                ["omnisharp"] = function()
                    lspconfig.omnisharp.setup({
                        on_attach = on_attach,
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
        -- toggle diagnostic
        vim.keymap.set("n", "<leader>dd", function()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end, { silent = true, noremap = true })
    end,
}
