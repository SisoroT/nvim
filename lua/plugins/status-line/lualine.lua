-- bottom status bar
return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",

    config = function()
        local colors = require("tokyonight.colors").setup({ transform = true })

        local tokyonight = {
            normal = {
                a = { bg = colors.bg_statusline, fg = colors.black },
                b = { bg = colors.bg_statusline, fg = colors.blue },
                c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
            },

            insert = {
                a = { bg = colors.bg_statusline, fg = colors.black },
                b = { bg = colors.bg_statusline, fg = colors.green },
            },

            command = {
                a = { bg = colors.bg_statusline, fg = colors.black },
                b = { bg = colors.bg_statusline, fg = colors.yellow },
            },

            visual = {
                a = { bg = colors.bg_statusline, fg = colors.black },
                b = { bg = colors.bg_statusline, fg = colors.magenta },
            },

            replace = {
                a = { bg = colors.bg_statusline, fg = colors.black },
                b = { bg = colors.bg_statusline, fg = colors.red },
            },

            terminal = {
                a = { bg = colors.bg_statusline, fg = colors.black },
                b = { bg = colors.bg_statusline, fg = colors.green1 },
            },

            inactive = {
                a = { bg = colors.bg_statusline, fg = colors.blue },
                b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
                c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
            },
        }

        require("lualine").setup({
            options = {
                -- theme = tokyonight,
                component_separators = "|",
                section_separators = "",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "filename" },
                lualine_c = { "diagnostics" },
                lualine_x = {
                    "branch",
                    {
                        "diff",
                        diff_color = {
                            added = { fg = colors.green },
                            modified = { fg = colors.orange },
                            removed = { fg = colors.red },
                        },
                    },
                },
                lualine_y = { "filetype", "location" },
                lualine_z = {
                    { "progress" },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
