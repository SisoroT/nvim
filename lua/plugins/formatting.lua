return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                cs = { "csharpier" },
                sh = { "shfmt" },

                -- prettier
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                markdown = { "prettier" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            },
            formatters = {
                stylua = {
                    prepend_args = { "--indent-type", "Spaces" },
                },
                prettier = {
                    prepend_args = { "--tab-width", "4", "--no-semi", "--single-quote", "--jsx-single-quote" },
                },
            },
        })
    end,
}
