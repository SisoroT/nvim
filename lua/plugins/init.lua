-- plugins w/o configs
return {
    -- better diagnostics
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = { { "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>" } },
    },

    -- lsp signatures
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        config = true,
    },

    -- auto brackets, quotes, etc
    {
        "windwp/nvim-autopairs",
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

    -- better comments (adds TODO, FIXME, etc)
    { "folke/todo-comments.nvim", event = "VeryLazy", config = true },

    -- highlights colors behind hex, rgb, and names
    -- { "catgoose/nvim-colorizer.lua", event = "BufReadPre", opts = {} },

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
