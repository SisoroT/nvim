-- better syntax highlighting
return {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    build = ":TSUpdate",
    dependencies = {
        -- rainbow parens
        "HiPhish/rainbow-delimiters.nvim",
        -- auto match html/jsx tags
        "windwp/nvim-ts-autotag",
        -- show context of current buffer contents
        "nvim-treesitter/nvim-treesitter-context",
        -- operations on inner and outer text objects
        "nvim-treesitter/nvim-treesitter-textobjects",
    },

    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all" (the listed parsers should always be installed)
            ensure_installed = {
                "bash",
                "c",
                "c_sharp",
                "comment",
                "css",
                "html",
                "javascript",
                "json",
                "lua",
                "typescript",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = false,
            },
            autotag = {
                enable = true,
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,

                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",

                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",

                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                    },
                },
            },
        })
    end,
}
