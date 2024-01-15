-- plugins w/o configs
return {
    -- better diagnostics
    -- TODO: test
    {
        "folke/trouble.nvim",
        event = "VimEnter",
        keys = { { "<leader>tt", "<cmd>TroubleToggle<cr>" } },
    },

    -- lsp signatures
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        config = true,
    },

    -- kill bad habits :)
    {
        "m4xshen/hardtime.nvim",
        event = "BufWinEnter",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
    },

    -- better movement
    {
        "ggandor/leap.nvim",
        keys = { "s", "S" },
        config = function()
            require("leap").create_default_mappings()
        end,
    },

    -- better comments (adds TODO, FIXME, etc)
    { "folke/todo-comments.nvim", event = "VeryLazy", config = true },

    -- highlights colors behind hex, rgb, and names
    { "NvChad/nvim-colorizer.lua", event = "VeryLazy", config = true },

    -- blankline for tabs
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}, event = "VeryLazy" },

    -- visualize git conflicts
    { "akinsho/git-conflict.nvim", event = "BufReadPost", config = true },

    -- sudo save
    {
        "lambdalisue/suda.vim",
        cmd = { "SudaWrite", "W" },
        config = function()
            vim.api.nvim_create_user_command("W", "SudaWrite", {})
        end,
    },
}
