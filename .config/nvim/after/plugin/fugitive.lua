vim.keymap.set('n', '<leader>gc', ':Git ')

vim.keymap.set('n', '<leader>r', function()
    vim.cmd.windo('e')
end)
