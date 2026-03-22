-- better syntax highlighting
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        -- rainbow parens
        "HiPhish/rainbow-delimiters.nvim",
        -- auto match html/jsx tags
        { "windwp/nvim-ts-autotag", opts = {} },
        -- show context of current buffer contents
        "nvim-treesitter/nvim-treesitter-context",
        -- operations on inner and outer text objects
        { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
    },

    config = function()
        require("nvim-treesitter").install({
            "bash",
            "c",
            "comment",
            "css",
            "html",
            "javascript",
            "jsdoc",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "yaml",
        })

        -- enable treesitter based syntax highlighting
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })

        -- Text Object Binds
        local tobj_select = require("nvim-treesitter-textobjects.select").select_textobject
        -- functions
        vim.keymap.set({ "x", "o" }, "af", function()
            tobj_select("@function.outer", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "if", function()
            tobj_select("@function.inner", "textobjects")
        end)
        -- parameters/arguments
        vim.keymap.set({ "x", "o" }, "aa", function()
            tobj_select("@parameter.outer", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "ia", function()
            tobj_select("@parameter.inner", "textobjects")
        end)
        -- conditionals
        vim.keymap.set({ "x", "o" }, "ai", function()
            tobj_select("@conditional.outer", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "ii", function()
            tobj_select("@conditional.inner", "textobjects")
        end)
        -- loops
        vim.keymap.set({ "x", "o" }, "al", function()
            tobj_select("@loop.outer", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "il", function()
            tobj_select("@loop.inner", "textobjects")
        end)
        -- classes
        vim.keymap.set({ "x", "o" }, "ac", function()
            tobj_select("@class.outer", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "ic", function()
            tobj_select("@class.inner", "textobjects")
        end)
    end,
}
