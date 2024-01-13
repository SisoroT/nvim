-- plugins w/o configs
return {
    -- better diagnostics
    {
        "folke/trouble.nvim",
        keys = { { "<leader>t", "<cmd>TroubleToggle<cr>" } },
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
    { "folke/todo-comments.nvim", config = true },

    -- highlights colors behind hex, rgb, and names
    { "NvChad/nvim-colorizer.lua", config = true },

    -- blankline for tabs
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- visualize git conflicts
    { "akinsho/git-conflict.nvim", version = "*", config = true },

    -- sudo save
    {
        "lambdalisue/suda.vim",
        cmd = { "SudaWrite", "W" },
        config = function()
            vim.api.nvim_create_user_command("W", "SudaWrite", {})
        end,
    },
}
