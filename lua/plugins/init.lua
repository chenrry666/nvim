---@type LazySpec[]
return {
  {
    'akinsho/toggleterm.nvim',
    cmd = {
      'ToggleTerm',
      'ToggleTermToggleAll',
      'ToggleTermSetName',
      'ToggleTermSendVisualLines',
      'ToggleTermSendVisualSelection',
    },
    keys = {
      { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>',              desc = 'Term float' },
      { '<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>', desc = 'Term horizontal split' },
      { '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>',   desc = 'Term vertical split' },
      { '<leader>tl', '<cmd>ToggleTerm direction=float lazygit<cr>',   desc = "LazyGit" },
      {
        '<F7>',
        '<cmd>ToggleTerm<cr>',
        desc = 'Toggle terminal',
        mode = { 't', 'n' },
      },
    },
    config = true,
  },

  {
    'nvim-lua/plenary.nvim',
    keys = {
      {
        '<leader>hpb',
        function()
          require('plenary.profile').start('profile.log', { flame = true })
        end,
        desc = 'Begin profiling',
      },
      {
        '<leader>hpe',
        function()
          require('plenary.profile').stop()
        end,
        desc = 'End profiling',
      },
    },
  },

  {
    'sindrets/diffview.nvim',
    cmd = {
      'DiffviewOpen',
      'DiffviewLog',
      'DiffviewClose',
      'DiffviewRefresh',
      'DiffviewFocusFiles',
      'DiffviewToggleFiles',
      'DiffviewFileHistory',
    },
    config = true,
  },

}
