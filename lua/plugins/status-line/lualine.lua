-- bottom status bar
return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",

    config = function()
        local colors = {
            bg = "#1c1c1c",
            fg = "#f8f8f2",
            yellow = "#f1fa8c",
            cyan = "#8be9fd",
            green = "#50fa7b",
            orange = "#ffb86c",
            purple = "#bd93f9",
            pink = "#ff79c6",
            red = "#ff5555",
            lightbg = "#28282B",
        }

        local mode_map = {
            n = { "  N ", colors.purple },
            i = { "  I ", colors.yellow },
            c = { " ﲵ C ", colors.pink },
            v = { "  V ", colors.green },
            V = { "  VL ", colors.green },
            ["\22"] = { "  VB ", colors.green },
            R = { " ﯒ R ", colors.purple },
            s = { " 麗S ", colors.orange },
            t = { "  T ", colors.red },
            ["!"] = { "  SH ", colors.red },
        }

        require("lualine").setup({
            options = {
                -- Disable sections and component separators
                component_separators = "",
                section_separators = "",
                globalstatus = true,
            },
            sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},

                -- LEFT SIDE --
                lualine_c = {
                    -- mode component
                    {
                        function()
                            return (mode_map[vim.fn.mode()] or { "  ", colors.fg })[1]
                        end,
                        -- auto change color according to neovims mode
                        color = function()
                            return { fg = (mode_map[vim.fn.mode()] or { "", colors.fg })[2] }
                        end,
                        padding = 0,
                    },
                    -- file info
                    { "filetype", colored = true, icon_only = true, padding = { left = 1 } },
                    { "filename", color = { fg = colors.fg, gui = "bold,italic" } },
                    { "filesize", padding = { right = 1 } },
                    -- diagnostics
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        symbols = { error = " ", warn = " ", info = " " },
                        diagnostics_color = {
                            error = { fg = colors.red },
                            warn = { fg = colors.yellow },
                            info = { fg = colors.cyan },
                        },
                    },
                },

                -- RIGHT SIDE --
                lualine_x = {
                    -- git
                    { "branch", icon = "", color = { fg = colors.green } },
                    {
                        "diff",
                        diff_color = {
                            added = { fg = colors.green },
                            modified = { fg = colors.orange },
                            removed = { fg = colors.red },
                        },
                    },
                    -- line number
                    {
                        function()
                            local cur_line = vim.api.nvim_win_get_cursor(0)[1]
                            local tot_lines = vim.api.nvim_buf_line_count(0)
                            return string.format("%3d/%d", cur_line, tot_lines)
                        end,
                    },
                    -- colored separator
                    {
                        function()
                            return "|"
                        end,
                        color = { fg = colors.pink },
                        padding = 0,
                    },
                    -- progress percentage
                    { "progress", icon = "", color = { fg = colors.purple } },
                    -- progress bar
                    {
                        function()
                            local chars =
                                { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
                            local cur_line = vim.api.nvim_win_get_cursor(0)[1]
                            local tot_lines = vim.api.nvim_buf_line_count(0)
                            local index = math.ceil((cur_line / tot_lines) * #chars)
                            return chars[index == 0 and 1 or index]
                        end,
                        color = { fg = colors.purple },
                        padding = { right = 1 },
                    },
                },
            },
            inactive_sections = {
                -- these are to remove the defaults
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
