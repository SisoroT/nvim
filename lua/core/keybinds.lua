local g = vim.g
local function map(mode, keybind, command)
    vim.keymap.set(mode, keybind, command, { noremap = true, silent = true })
end

-- map leader key to space
g.mapleader = " "
g.maplocalleader = " "

-- open terminal in split window
map("n", "<leader>ov", "<cmd>vsplit | term<cr>")
map("n", "<leader>oh", "<cmd>split | resize 13 | term<cr>")

-- open netrw
map("n", "-", vim.cmd.Ex)

-- rebind exit for terminal
map("t", "<C-x>", "<C-\\><C-n>")

-- make jumping between search results easier to follow
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- make scrolling easier to follow
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- cursor doesn't move when joining lines
map("n", "J", "mzJ`z")

-- navigate double windows ctrl+vim keys
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- alternative keybind for normal mode
map({ "i", "v" }, "ii", "<Esc>")

-- clear highlighted search results
map("n", "<leader>n", "<cmd>noh<cr>")

-- move to the next/previous buffer
map("n", "<Tab>", "<cmd>bnext<cr>")
map("n", "<S-Tab>", "<cmd>bprevious<cr>")

-- resize with ctrl+arrows
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- source shortcut
map("n", "<C-s>", "<cmd>so%<cr>")

-- built-in comments
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, silent = true })
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, silent = true })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, silent = true })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, silent = true })

-- close a buffer
map("n", "<leader>x", "<cmd>bd<cr>")

-- keybind to use find and replace
map("n", "<leader>s", ":%s//gI<Left><Left><Left>")

-- move line up and down in normal and visual modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map("x", "<S-j>", ":move '>+1<CR>gv=gv")
map("x", "<S-k>", ":move '<-2<CR>gv=gv")

-- use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map("o", "<M-a>", ":<C-U>normal! mzggVG<CR>`z")
map("x", "<M-a>", ":<C-U>normal! ggVG<CR>")
