return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- "stevearc/conform.nvim",
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())
        --capabilities.textDocument.completion.completionItem.snippetSupport = true


        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_enable = false,
            --ensure_installed = {
                --"lua_ls",
                --"gopls",
            --}
        })
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                --['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                --['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-f>'] = cmp.mapping.abort(),
                ["<C-o>"] = cmp.mapping.complete(),
                ["<C-p>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif require('luasnip').locally_jumpable(1) then
                        require('luasnip').jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<C-n>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif require('luasnip').locally_jumpable(-1) then
                        require('luasnip').jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "copilot", group_index = 2 },
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                    { name = 'buffer' },
                })
        })

        -- clangd
        -- gopls
        -- lua-language-server lua_ls

        require('lspconfig')['clangd'].setup {
            capabilities = capabilities
        }
        require('lspconfig')['gopls'].setup {
            capabilities = capabilities,
            settings = {
                gopls = {
                    usePlaceholders = true,  -- включает плейсхолдеры аргументов функции
                    completeUnimported = true,
                    staticcheck = true,
                    directoryFilters = { "-.git",},
                }
            }
        }
        require('lspconfig')['lua_ls'].setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file('', true),
                },
            },
        }

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
