-- fuzzy file finder
return {
    "nvim-telescope/telescope.nvim",
    module = false,
    keys = {
        { "<leader>ff" },
        { "<leader>fc" },
        { "<leader>fg" },
        { "<leader>fw" },
        { "<leader>fW" },
        { "<leader>vh" },
        { "<leader>vk" },
        { "gr" },
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

        -- search files in current directory
        vim.keymap.set("n", "<leader>ff", builtin.find_files)
        -- search all files in .config folder
        vim.keymap.set("n", "<leader>fc", function()
            builtin.find_files({ prompt_title = "Search ~/.config/", cwd = vim.fn.expand("~/.config/") })
        end)

        -- rg strings in cwd
        vim.keymap.set("n", "<leader>fg", builtin.live_grep)

        -- search vim help docs
        vim.keymap.set("n", "<leader>vh", builtin.help_tags)
        -- search vim keymaps
        vim.keymap.set("n", "<leader>vk", builtin.keymaps)

        -- search lsp_references
        vim.keymap.set("n", "gr", builtin.lsp_references)

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
    end,
}
