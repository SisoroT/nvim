-- allows for interatction with databases
return {
    "tpope/vim-dadbod",
    keys = {
        -- toggle DBUI
        { "<leader>bu", ":DBUIToggle<CR>" },
        -- run entire file
        { "<leader>bb", ":%DB<CR>" },
        -- run selection
        { "<leader>Db", ":DB<CR>", mode = "v" },
    },
    -- provides a ui for vim-dadbod
    dependencies = "kristijanhusak/vim-dadbod-ui",

    config = function()
        -- set database connection as global variable
        vim.g.db = "<dbURL>"
        require("plugins.dadbod")
    end,
}
