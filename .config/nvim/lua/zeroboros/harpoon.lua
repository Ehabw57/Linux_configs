local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>pn", ui.nav_next)
vim.keymap.set("n", "<leader>pp", ui.nav_prev)
