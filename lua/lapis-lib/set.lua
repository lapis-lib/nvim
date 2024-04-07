vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    -- Define own colours
    vim.api.nvim_set_hl(0, '@org.agenda.scheduled', { fg = '#ece1d7' })
  end,
})
