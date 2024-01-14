return {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",

    config = function()
        require("gitsigns").setup({
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`

            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                delay = 1000,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",

            -- Keybinds
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, keybind, command, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, keybind, command, opts)
                end

                -- Navigation
                map("n", "<leader>hh", gs.prev_hunk)
                map("n", "<leader>hl", gs.next_hunk)

                -- Actions
                map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
                map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
                map("n", "<leader>hS", gs.stage_buffer)
                map("n", "<leader>hu", gs.undo_stage_hunk)
                map("n", "<leader>hR", gs.reset_buffer)
                map("n", "<leader>hp", gs.preview_hunk)
                map("n", "<leader>hb", function()
                    gs.blame_line({ full = true })
                end)
                map("n", "<leader>tb", gs.toggle_current_line_blame)
                map("n", "<leader>hd", gs.diffthis)
                map("n", "<leader>hD", function()
                    gs.diffthis("~")
                end)
                map("n", "<leader>td", gs.toggle_deleted)

                -- Text object
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
            end,
        })
    end,
}
