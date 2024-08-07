local mark = require('harpoon.mark');
local ui = require('harpoon.ui');

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<c-e>',  ui.toggle_quick_menu)

vim.keymap.set('n', '<c-h>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<c-j>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<c-k>', function() ui.nav_file(3) end)
vim.keymap.set('n', '<c-l>', function() ui.nav_file(4) end)
