-- fuzzy file finder
return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    cmd = { "Telescope" },
    keys = {
        -- file search
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        {
            "<leader>fc",
            function()
                require("telescope.builtin").find_files({
                    prompt_title = "Search ~/.config/",
                    cwd = vim.fn.expand("~/.config/"),
                })
            end,
            desc = "Search Config",
        },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
        -- text search
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
        {
            "<leader>fw",
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
            end,
            desc = "Grep Word",
        },
        {
            "<leader>fW",
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") })
            end,
            desc = "Grep WORD",
        },
        { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
        -- vim search
        { "<leader>vh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
        { "<leader>vk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    },

    config = function()
        local actions = require("telescope.actions")

        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                },
                file_ignore_patterns = {
                    "node_modules/",
                    ".git/",
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                },
            },
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
            },
        })

        require("telescope").load_extension("fzf")
    end,
}
