return {
    'Wansmer/langmapper.nvim',
    lazy = false,
    priority = 1, -- High priority is needed if you will use `autoremap()`
    config = function()
        require('langmapper').setup({
            disable_hack_modes = {},
            automapping_modes = { 'n', 'v', 'x', 's', 'i' },
        })

        vim.api.nvim_create_autocmd('vimenter', {
            once = true,
            callback = function()
                require('langmapper').automapping({ global = true, buffer = true })
            end,
        })
    end,
}
