vim.keymap.set('n', '<leader>pv', ':Oil<CR>', { desc = 'Show [P]roject [V]iew' })
vim.keymap.set('n', '<C-F12>', ':Oil<CR>')
vim.keymap.set('n', '<leader>cd', ':Telescope cder<CR>', { desc = '[C]hange working [D]irectory' })

-- H and L navigate beginning / end of line
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')

-- bufferline navigation
vim.keymap.set('n', '<C-PageUp>', ':BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', '<C-PageDown>', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<A-[>', ':BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', '<A-]>', ':BufferLineCycleNext<CR>', { silent = true })
-- nnoremap('<leader>u', ':Undotreeshow<CR>')
--
-- vnoremap('J', ":m '>+1<CR>gv=gv")
-- vnoremap('K', ":m '<-2<CR>gv=gv")
--
-- nnoremap("Y", "yg$")
-- nnoremap("Y", "yg$")
-- nnoremap("Y", "yg$")
-- nnoremap("Y", "yg$")
-- nnoremap("Y", "yg$")
-- nnoremap("Y", "yg$")
--
-- -- greatest remap ever
-- xnoremap("<leader>p", "\"_dP")
--
-- -- " Swap single for double quotes (and the other way around) for this chunk
-- -- nnoremap("<leader>\'", "mqva\"l:s/\%V\"\%V/\'/g<CR>`q")
-- -- nnoremap("<leader>\"", "mqva\'l:s/\%V\'\%V/\"/g<CR>`q")
-- -- " Add quotes around (at start of, and at end of) visually selected text
-- -- vnoremap("<leader>\'", "<Esc>`>a\'<Esc>`<i\'<Esc>")
-- -- vnoremap("<leader>\"", "<Esc>`>a\"<Esc>`<i\"<Esc>")
