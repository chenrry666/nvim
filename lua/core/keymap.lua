local utils = require 'core.utils'
local has = utils.has
local map = utils.map

utils.map_opt({ silent = true })
map('n', '<leader>bn', { '<cmd>bnext<CR>', desc = 'Next buf' })
map('n', '<leader>bp', { '<cmd>bprevious<CR>', desc = 'Prev buf' })

-- Terminal
-- write files with sudo permission
-- this is useful when you forget to use `sudo nvim foo`
-- TODO: replace with suda.nvim
-- map('n', '<leader>S', { '<cmd>w !sudo tee % >/dev/null<CR>', desc = 'sudo write' })
vim.cmd.cabbrev('w!!', 'w !sudo tee > /dev/null %')

map({ 'n', 'v' }, 'j', { "v:count ? 'j' : 'gj'", expr = true, desc = 'Move cursor down' })
map({ 'n', 'v' }, 'k', { "v:count ? 'k' : 'gk'", expr = true, desc = 'Move cursor up' })

map('n', 'H', { '0^' })
map('n', 'L', { '$' })

map('n', '<leader>gB', { function() require('telescope.builtin').git_branches() end, desc = 'Git branches' })
map('n', '<leader>gC', { function() require('telescope.builtin').git_commits() end, desc = 'Git commits' })
map('n', '<leader>gs', { function() require('telescope.builtin').git_status() end, desc = 'Git status' })

map('n', 'K', { function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end,
  desc = "Preview fold or hover"
})
