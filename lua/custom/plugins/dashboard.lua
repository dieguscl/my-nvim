return {
  'nvimdev/dashboard-nvim',
  config = function()
    require('dashboard').setup {
      theme = 'hyper', --  theme is doom and hyper default is hyper
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
