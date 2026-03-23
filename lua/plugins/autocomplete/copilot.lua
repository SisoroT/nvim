return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",

    dependencies = {
        "copilotlsp-nvim/copilot-lsp",
    },

    opts = {
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept = "<M-n>",
                prev = "<M-e>",
                next = "<M-i>",
                dismiss = "<M-o>",
            },
        },
        nes = {
            enabled = true,
            keymap = {
                accept_and_goto = "<M-h>",
                dismiss = "<Esc>",
            },
        },
    },
}
