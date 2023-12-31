local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- open Lazy
vim.keymap.set("n", "<leader>z", "<cmd>Lazy<cr>")

local plugins = {
    { import = "plugins" },
    { import = "plugins.lsp" },
    { import = "plugins.autocomplete" },
    { import = "plugins.status-line" },
}

require("lazy").setup({
    spec = plugins,
    ui = { border = "rounded" },
    change_detection = { notify = false },
})
