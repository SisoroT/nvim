return {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
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

    keys = {
        { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Actions palette" },
        { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle chat" },
        { "<leader>ai", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "Inline assistant" },
        { "<leader>aA", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add selection to chat" },
    },

    opts = {
        interactions = {
            chat = { adapter = { name = "copilot", model = "gpt-5.2-codex" } },
            inline = { adapter = { name = "copilot", model = "gpt-5-mini" } },
            cmd = { adapter = "copilot" },
        },
    },
}
