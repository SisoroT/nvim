return {
    {
        "Zeioth/compiler.nvim",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        keys = {
            { "<leader>cc", "<cmd>CompilerOpen<cr>" },
            { "<leader>ct", "<cmd>CompilerToggleResults<cr>" },
            { "<leader>cr", "<cmd>CompilerRedo<cr>" },
        },
        dependencies = { "stevearc/overseer.nvim" },
        opts = {},
    },
    {
        "stevearc/overseer.nvim",
        commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        opts = {
            task_list = {
                direction = "bottom",
                min_height = 25,
                max_height = 25,
                default_detail = 1,
            },
        },
    },
}
