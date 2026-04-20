-- run the jupytext cell the cursor is in (between `# %%` markers)
local function molten_eval_cell()
    local start = vim.fn.search("^# %%", "bcnW")
    start = (start == 0) and 1 or (start + 1)
    local stop = vim.fn.search("^# %%", "nW")
    stop = (stop == 0) and vim.fn.line("$") or (stop - 1)
    vim.fn.MoltenEvaluateRange(start, stop)
end

return {
    {
        -- edit .ipynb files as plain text (cell markers auto-converted)
        "goerz/jupytext.nvim",
        version = "0.2.0",
        opts = {
            format = "py:percent",
        },
    },

    {
        -- render plot/figure outputs inline
        "3rd/image.nvim",
        ft = { "python", "markdown" },
        opts = {
            max_width = 100,
            max_height = 12,
            max_height_window_percentage = math.huge,
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        },
    },

    {
        -- send code to a Jupyter kernel, view outputs inline
        "benlubas/molten-nvim",
        version = "^1.0.0",
        build = ":UpdateRemotePlugins",
        dependencies = { "3rd/image.nvim" },
        ft = { "python" },
        init = function()
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
        end,
        keys = {
            { "<leader>mi", "<cmd>MoltenInit<cr>", desc = "Molten: init kernel" },
            { "<leader>ml", "<cmd>MoltenEvaluateLine<cr>", desc = "Molten: run line" },
            { "<leader>me", "<cmd>MoltenEvaluateOperator<cr>", desc = "Molten: run operator (motion)" },
            { "<leader>mr", molten_eval_cell, desc = "Molten: run current cell" },
            { "<leader>mr", ":<C-u>MoltenEvaluateVisual<cr>gv", mode = "v", desc = "Molten: run selection" },
            { "<leader>mR", "<cmd>MoltenReevaluateCell<cr>", desc = "Molten: re-run last cell" },
            { "<leader>mo", "<cmd>MoltenShowOutput<cr>", desc = "Molten: show output" },
            { "<leader>mh", "<cmd>MoltenHideOutput<cr>", desc = "Molten: hide output" },
        },
    },
}
