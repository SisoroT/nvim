return {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    dependencies = {
        "copilotlsp-nvim/copilot-lsp",
    },

    opts = {
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept = "<M-a>",
                next = "<M-l>",
                prev = "<M-h>",
                dismiss = "<M-d>",
            },
        },
        nes = {
            enabled = true,
            keymap = {
                accept_and_goto = "<leader>p",
                accept = false,
                dismiss = "<Esc>",
            },
        },
    },
}
