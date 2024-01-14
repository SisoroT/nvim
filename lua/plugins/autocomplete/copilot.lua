return {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",

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
    },
}
