---@type LazySpec[]
return {
  {
    'nvim-neorg/neorg',
    cmd = { 'Neorg' },
    ft = "neorg",
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {},
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/notes',
              },
              default_workspace = 'notes',
            },
          },
          ['core.completion'] = {
            config = { engine = 'nvim-cmp' },
          },
          ['core.presenter'] = {
            config = {
              zen_mode = 'zen-mode',
            },
          },
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
}
