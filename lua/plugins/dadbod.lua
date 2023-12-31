-- allows for interatction with databases
return {
    "tpope/vim-dadbod",
    -- provides a ui for vim-dadbod
    dependencies = {
        "kristijanhusak/vim-dadbod-ui",
        keys = {
            -- toggle DBUI
            { "<leader>du", ":DBUIToggle<CR>" },
            -- run entire file
            { "<leader>db", ":%DB<CR>" },
            -- run selection
            { "<leader>db", ":DB<CR>", mode = "v" },
        },

        config = function()
            -- set database connection as global variable
            vim.g.db = "<dbURL>"
            require("plugins.dadbod")
        end,
    },
}
