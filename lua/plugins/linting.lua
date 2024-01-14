return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            python = { "flake8" },
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            html = { "tidy" },
            sh = { "shellcheck" },
        }

        -- trigger linting on BufEnter, save, and insert leave
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            callback = function()
                lint.try_lint()
                lint.try_lint("typos")
            end,
        })
    end,
}
