-- quick way to jump between files
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = {
        { "<leader>a", "<cmd>lua require('harpoon'):list():append()<cr>" },
        { "<M-v>",     "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>" },
        { "<M-h>",     "<cmd>lua require('harpoon'):list():select(1)<cr>" },
        { "<M-j>",     "<cmd>lua require('harpoon'):list():select(2)<cr>" },
        { "<M-k>",     "<cmd>lua require('harpoon'):list():select(3)<cr>" },
        { "<M-l>",     "<cmd>lua require('harpoon'):list():select(4)<cr>" },
        { "<M-p>",     "<cmd>lua require('harpoon'):list():prev()<cr>" },
        { "<M-n>",     "<cmd>lua require('harpoon'):list():next()<cr>" },
    },
    dependencies = "nvim-lua/plenary.nvim",

    config = true,
}
