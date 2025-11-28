local key = vim.keymap.set

vim.g.mapleader = " "

key("n", "n", "nzzzv")
key("n", "N", "Nzzzv")
key("n", "J", "mzJ`z")


key("n", "<C-d>", "<C-d>zz")
key("n", "<C-u>", "<C-u>zz")

-- Harpoon
key("n", "<leader>a", function() require("harpoon.mark").add_file() end)
key("n", "<leader>h", function() require("harpoon.ui").toggle_quick_menu() end)

-- File explorer toggle
key("n", "<leader>e", ":Ex<CR>")
    

