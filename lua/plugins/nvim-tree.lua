-- file tree
return {
    "kyazdani42/nvim-tree.lua",
    lazy = true,
    keys = {
        -- open file expolorer in current directory
        { "<leader>e", ":NvimTreeToggle<cr>", silent = true },
    },
    dependencies = "nvim-tree/nvim-web-devicons",

    config = function()
        -- keybinds
        local function on_attach(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)

            vim.keymap.set("n", "<CR>", api.tree.change_root_to_node, opts("CD"))
            vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
            vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
            vim.keymap.set("n", "<BS>", api.tree.change_root_to_parent, opts("Up"))
        end

        require("nvim-tree").setup({
            on_attach = on_attach,
            -- hijack the cursor in the tree to put it at the start of the filename
            hijack_cursor = true,
            -- show lsp diagnostics in the signcolumn
            diagnostics = {
                enable = true,
            },
            -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
            update_focused_file = {
                enable = true,
                -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
                -- only relevant when `update_focused_file.enable` is true
                update_root = true,
            },
        })

        -- closes neovim automatically when the tree is the last **WINDOW** in the view
        vim.api.nvim_create_autocmd("BufEnter", {
            nested = true,
            callback = function()
                if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
                    vim.cmd("quit")
                end
            end,
        })
    end,
}
