-- debugger
return {
    "mfussenegger/nvim-dap",
    keys = {
        "<leader>du",
        "<leader>dr",
        "<leader>db",
        "<leader>dc",
        "<leader>dv",
        "<leader>di",
        "<leader>do",
    },
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
    },

    config = function()
        local dap = require("dap")
        require("dapui").setup()
        require("nvim-dap-virtual-text").setup()

        -- change breakpoint icon
        vim.fn.sign_define(
            "DapBreakpoint",
            { text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
        )

        -- keymaps
        -- ui
        vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", { noremap = true })
        vim.keymap.set("n", "<leader>dr", "<cmd>lua require('dapui').open({reset = true})<cr>", { noremap = true })

        -- dap
        vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { noremap = true })
        vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>", { noremap = true })
        vim.keymap.set("n", "<leader>do", "<cmd>lua require('dap').step_over()<cr>", { noremap = true })
        vim.keymap.set("n", "<leader>di", "<cmd>lua require('dap').step_into()<cr>", { noremap = true })
        vim.keymap.set("n", "<leader>de", "<cmd>lua require('dap').step_out()<cr>", { noremap = true })
    end,
}
