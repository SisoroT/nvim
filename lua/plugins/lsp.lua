return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            },
        },
        "mason-org/mason-lspconfig.nvim",
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },

    config = function()
        -- needed for css autocomplete
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        local servers = {
            "bashls",
            "cssls",
            "html",
            "jsonls",
            "lua_ls",
            "pyright",
            "ts_ls",
            "vimls",
        }

        -- Ensure servers are installed
        require("mason-lspconfig").setup({
            ensure_installed = servers,
        })

        -- Apply capabilities to all servers
        vim.lsp.config("*", {
            capabilities = capabilities,
        })
        -- Enable all servers using native API
        vim.lsp.enable(servers)

        -- Buffer-local LSP keymaps
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "H", vim.diagnostic.open_float, opts)

                -- cd to root on attach
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                if client and client.config.root_dir then
                    vim.cmd("lcd " .. vim.fn.fnameescape(client.workspace_folders[1].name))
                end
            end,
        })

        -- Global keymaps
        vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { silent = true })
        vim.keymap.set("n", "<leader>dd", function()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end, { silent = true })
    end,
}
