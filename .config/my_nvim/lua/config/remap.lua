vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "jj", "<Esc>")

--remap for search cleaning
vim.keymap.set('n', '<leader><space>', function()
    vim.cmd.let('@/=\"\"')
end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- курсор остаётся на месте
vim.keymap.set("n", "J", "mzJ`z")
-- курсор встаёт в центр
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Для поиска, чтобы ставил курсор по центру экрана и искал в fold'ах
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Выравнять абзац (a paragraph), и вернуть курсор на место
vim.keymap.set("n", "=ap", "ma=ap'a")

-- greatest remap ever
-- вставить без потери содержимого буфера
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- скопировать в системный буфер
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- удалить без потери буфера
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

-- замена слова под курсором
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- сохранение файла
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

vim.keymap.set("n", "<c-z>", "<cmd>set wrap!<CR>")

-- для Go кода вставка обработки ошибок
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set(
    "n",
    "<leader>ea",
    "oassert.NoError(err, \"\")<Esc>F\";a"
)

vim.keymap.set(
    "n",
    "<leader>ef",
    "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj"
)

vim.keymap.set(
    "n",
    "<leader>el",
    "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
)

-- Удобное перемещение по визуально‑перенесённым строкам
-- local opts = { expr = true, silent = true }
-- 
-- vim.keymap.set('n', 'k', function()
--     return vim.v.count == 0 and 'gk' or 'k'
-- end, opts)
-- 
-- vim.keymap.set('n', 'j', function()
--     return vim.v.count == 0 and 'gj' or 'j'
-- end, opts)
-- 
-- vim.keymap.set('n', '<Up>', function()
--     return vim.v.count == 0 and 'g<Up>' or '<Up>'
-- end, opts)
-- 
-- vim.keymap.set('n', '<Down>', function()
--     return vim.v.count == 0 and 'g<Down>' or '<Down>'
-- end, opts)

vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'j', 'gj')

vim.keymap.set('n', 'gK', function()
    local new_config = not vim.diagnostic.config().virtual_text
    vim.diagnostic.config({
        virtual_text = new_config,
    })
end, { desc = 'Toggle diagnostic virtual_lines' })
