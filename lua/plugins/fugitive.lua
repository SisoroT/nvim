-- manage git from vim
return {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = {
        {
            "<leader>gg",
            function()
                -- delete the fugitive buffer if it exists
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                    if vim.bo[buf].filetype == "fugitive" then
                        vim.api.nvim_buf_delete(buf, { force = false })
                        return
                    end
                end
                -- otherwise, open the fugitive buffer
                if vim.fn.FugitiveHead() ~= "" then
                    vim.cmd("Git | resize 20")
                end
            end,
            desc = "Toggle Git Status",
        },
        { "<leader>gp", "<cmd>Git push<cr>", desc = "Git Push" },
        { "<leader>gl", "<cmd>Git pull<cr>", desc = "Git Pull" },
        { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git Commit" },
    },
}
