return {
  {
    'TimUntersberger/neogit',
    cmd = 'Neogit',
    config = function()
      local neogit = require 'neogit'
      neogit.setup {}
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    enabled = vim.fn.executable 'git' == 1,
    ft = 'gitcommit',
    event = 'User GitFile',
    cmd = 'Gitsigns',
    config = function()
      require 'gitsigns'.setup {
        trouble = true,
        signs = {
          add = { text = '▎' },
          change = { text = '▎' },
          delete = { text = '▎' },
          topdelete = { text = '契' },
          changedelete = { text = '▎' },
          untracked = { text = '▎' },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,  -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = 'rounded',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1,
        },
        yadm = {
          enable = false,
        },
      }
    end,
  },
}
