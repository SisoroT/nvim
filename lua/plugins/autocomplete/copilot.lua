return {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    opts = {},
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        {
            "zbirenbaum/copilot.lua",
            dependencies = { "copilotlsp-nvim/copilot-lsp" },

            opts = {
                suggestion = { enabled = false }, -- blink-copilot handles suggestions
                nes = {
                    enabled = true,
                    keymap = {
                        accept_and_goto = "<Tab>",
                        dismiss = "<Esc>",
                    },
                },
            },
        },
    },
}
