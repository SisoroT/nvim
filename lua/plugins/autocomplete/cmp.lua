-- autocomplete
return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- icons for autocomplete
        "onsails/lspkind-nvim",
        -- snippets
        {
            "L3MON4D3/LuaSnip",
            dependencies = { "rafamadriz/friendly-snippets" },
        },
        -- autocomplete sources
        { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-calc" },
        { "saadparwaiz1/cmp_luasnip" },
    },

    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local ls = require("luasnip")

        cmp.setup({
            completion = {
                completeopt = "menuone,noinsert",
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = {
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<CR>"] = cmp.mapping.confirm({
                    select = true,
                }),
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol", -- show only symbol annotations
                }),
            },
            sources = {
                { name = "luasnip" },
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "buffer" },
                { name = "path" },
                { name = "calc" },
            },
        })

        -- LuaSnip
        require("luasnip.loaders.from_vscode").lazy_load()
        -- jump forwards
        vim.keymap.set({ "i", "s" }, "<C-j>", function()
            ls.jump(1)
        end)
        -- jump backwards
        vim.keymap.set({ "i", "s" }, "<C-k>", function()
            ls.jump(-1)
        end)
    end,
}
