return {
    "tpope/vim-fugitive",
    event = "BufWinEnter",
    config = function()
        local function showFugitiveGit()
            if vim.fn.FugitiveHead() ~= "" then
                vim.cmd([[
                Git
                resize 20
                ]])
            end
        end

        local function toggleFugitiveGit()
            if vim.fn.buflisted(vim.fn.bufname("fugitive:///*/.git//$")) ~= 0 then
                vim.cmd([[ execute ':bdelete' bufname('fugitive:///*/.git//$') ]])
            else
                showFugitiveGit()
            end
        end

        vim.keymap.set("n", "<leader>g", toggleFugitiveGit)
    end,
}
