return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        local lint = require("lint")

        local function is_linter_installed(linter)
            if vim.fn.executable(linter) ~= 1 then
                vim.notify(linter .. " is not installed.", vim.log.levels.WARN)
                return false
            end
            return true
        end

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

                if is_linter_installed("typos") then
                    lint.try_lint("typos")
                end
            end,
        })
    end,
}
