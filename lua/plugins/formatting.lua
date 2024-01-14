return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        require("conform").setup({
            formatters_by_ft = {
                -- lua = { "stylua" },
                python = { "black" },
                cs = { "csharpier" },
                bash = { "shfmt" },

                -- prettier
                -- javascript = { "prettier" },
                -- typescript = { "prettier" },
                -- javascriptreact = { "prettier" },
                -- typescriptreact = { "prettier" },
                -- css = { "prettier" },
                -- html = { "prettier" },
                -- json = { "prettier" },
                -- markdown = { "prettier" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            },
        })
    end,
}
