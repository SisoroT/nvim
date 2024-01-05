-- fuzzy file finder
return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    keys = {
        -- search files in current directory
        { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
        -- search all files in .config folder
        {
            "<leader>fc",
            "<cmd>lua require('telescope.builtin').find_files({prompt_title = 'Search ~/.config/', cwd = vim.fn.expand('~/.config/')})<cr>",
        },
        -- search for string in cwd with ripgrep
        { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
        -- search projects
        { "<leader>fp", "<cmd>lua require'telescope'.extensions.projects.projects{}<cr>" },
        { "<leader>fw" },
        { "<leader>fW" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
    },

    config = function()
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        require("telescope").setup({
            defaults = {
                color_devicons = true,
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-s>"] = actions.select_horizontal,
                    },
                },
                file_ignore_patterns = {
                    "node_modules/",
                    ".git/",
                },
                vimgrep_arguments = {
                    "rg",
                    "--hidden",
                    "--smart-case",
                    "--column",
                },
            },
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden" },
                },
                live_grep = { "rg", "--hidden", "" },
            },
            extensions = {},
        })

        -- keybinds
        -- search for word under cursor
        vim.keymap.set("n", "<leader>fw", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)

        -- search for WORD under cursor
        vim.keymap.set("n", "<leader>fW", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)

        -- load extensions
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("projects")
    end,
}
