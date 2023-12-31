-- auto bracket pairing
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",

    config = function()
        require("nvim-autopairs").setup({
            -- change default fast_wrap
            fast_wrap = {
                map = "<M-w>",
                end_key = "w",
                keys = "qertyuiopzxcvbnmasdfghjkl",
            },
        })

        -- If you want insert `(` after select function or method item
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
