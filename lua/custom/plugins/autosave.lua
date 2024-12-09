-- not have to do :w all the time
local group = vim.api.nvim_create_augroup('autosave', {})

vim.api.nvim_create_autocmd('User', {
  pattern = 'AutoSaveEnable',
  group = group,
  callback = function()
    vim.notify('AutoSave enabled', vim.log.levels.INFO)
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'AutoSaveDisable',
  group = group,
  callback = function()
    vim.notify('AutoSave disabled', vim.log.levels.INFO)
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'AutoSaveWritePost',
  group = group,
  callback = function(opts)
    if opts.data.saved_buffer ~= nil then
      local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
      vim.notify('AutoSave: saved ' .. filename .. ' at ' .. vim.fn.strftime '%H:%M:%S', vim.log.levels.INFO)
    end
  end,
})
return {
  'okuuva/auto-save.nvim',
  lazy = false,
  keys = {
    -- toggle autosave
    { '<leader>n', '<cmd>ASToggle<CR>', desc = 'Toggle auto-save' },
  },
  config = function()
    require('auto-save').setup {
      noautocmd = true,
      enabled = true,
    }
  end,
}
