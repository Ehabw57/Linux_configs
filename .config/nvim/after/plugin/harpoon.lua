local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>pn", ui.nav_next)
vim.keymap.set("n", "<leader>pp", ui.nav_prev)

vim.keymap.set("n", "mj", function () ui.nav_file(1) end)
vim.keymap.set("n", "mk", function () ui.nav_file(2) end)
vim.keymap.set("n", "ml", function () ui.nav_file(3) end)
