---@diagnostic disable: missing-fields
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'c',
    'comment',
    'cpp',
    'diff',
    'embedded_template',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'http',
    'ini',
    'javascript',
    'json',
    'json5',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
    'regex',
    'ron',
    'ssh_config',
    'toml',
    'vim',
    'vimdoc',
    'yaml',
    'yaml',
    'yuck',
    'zig',
  },
  auto_install = false,
  sync_install = false,
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
    -- disable slow treesitter highlight for large files
    ---@diagnostic disable-next-line: unused-local
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = { enable = true },
})
