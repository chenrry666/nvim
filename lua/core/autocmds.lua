local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local namespace = vim.api.nvim_create_namespace

vim.on_key(function(char)
  if vim.fn.mode() == 'n' then
    local new_hlsearch = vim.tbl_contains({ '<CR>', 'n', 'N', '*', '#', '?', '/' }, vim.fn.keytrans(char))
    if vim.opt.hlsearch:get() ~= new_hlsearch then vim.opt.hlsearch = new_hlsearch end
  end
end, namespace 'auto_hlsearch')

autocmd('FileType', {
  desc = 'Make q close help, man, quickfix, dap floats',
  group = augroup('q_close_windows', { clear = true }),
  pattern = { 'qf', 'help', 'man', 'dap-float' },
  callback = function(event)
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true, nowait = true })
  end,
})

autocmd('TextYankPost', {
  desc = 'Highlight yanked text',
  group = augroup('highlightyank', { clear = true }),
  pattern = '*',
  callback = function() vim.highlight.on_yank { higroup = 'PmenuSel', timeout = 600 } end,
})

autocmd({ 'BufEnter', 'BufNewFile' }, {
  group = augroup('NvimTree', { clear = true }),
  pattern = '*',
  callback = function()
    local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))
    if stats and stats.type == 'directory' then
      vim.cmd.NvimTreeOpen(vim.api.nvim_buf_get_name(0))
    end
  end,
})
