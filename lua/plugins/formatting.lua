return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "ConformInfo",

    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
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
            yaml = { "prettier" },
        },
        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 1000,
        },
        formatters = {
            stylua = {
                prepend_args = { "--indent-type", "Spaces" },
            },
            prettier = {
                prepend_args = { "--tab-width", "4", "--no-semi", "--single-quote", "--jsx-single-quote" },
            },
        },
    },
}
