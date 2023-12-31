-- quick commentary
return {
    "numToStr/Comment.nvim",
    lazy = false,

    opts = {
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
            ---Line-comment toggle keymap
            line = "ee",
            ---Block-comment toggle keymap
            block = "eq",
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
            ---Line-comment keymap
            line = "ee",
            ---Block-comment keymap
            block = "eq",
        },
        ---LHS of extra mappings
        extra = {
            ---Add comment on the line above
            above = "eO",
            ---Add comment on the line below
            below = "eo",
            ---Add comment at the end of line
            eol = "gcA",
        },
    },
}
