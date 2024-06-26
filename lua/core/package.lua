local lazypath = vim.fn.getenv 'HOME' .. '/.cache/lazy_nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system { 'mkdir', '-pv', lazypath .. '/lazy.nvim' }
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://ghproxy.com/github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath .. '/lazy.nvim',
  }
  local oldcmdheight = vim.opt.cmdheight:get()
  vim.opt.cmdheight = 1
  vim.notify 'Please wait while plugins are installed...'
  vim.api.nvim_create_autocmd('User', {
    once = true,
    pattern = 'LazyInstall',
    callback = function()
      vim.cmd.bw()
      vim.opt.cmdheight = oldcmdheight
      vim.tbl_map(function(module)
        pcall(require, module)
      end, { 'nvim-treesitter' })
    end,
  })
end
vim.opt.rtp:prepend(lazypath .. '/lazy.nvim')

require('lazy').setup({
  { import = 'plugins' },
  { import = 'plugins.filetype' },
}, {
  root = lazypath, -- directory where plugins will be installed
  lockfile = lazypath .. '/lazy-lock.json',
  defaults = { lazy = true },
  git = {
    timeout = 600,
  },
  change_detection = {
    notify = false,
  },
  performance = {
    cache = {
      disable_events = { 'UIEnter', 'BufReadPre' },
      ttl = 3600 * 24 * 2, -- keep unused modules for up to 2 days
      path = vim.fn.stdpath 'config' .. '/lazy/cache',
    },
    reset_packpath = true,
    rtp = {
      reset = true,
      ---@type string[]
      paths = {}, -- add any custom paths here that you want to indluce in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        'tohtml',
        -- 'gzip',
        -- 'zip',
        -- 'zipPlugin',
        -- 'tar',
        -- 'tarPlugin',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'shada_plugin',

        'rplugin',
        'luasnip',
      },
    },
  },
  diff = {
    cmd = 'diffview.nvim',
  },
  dev = {
    -- directory where you store your local plugin projects
    path = '~/pro/',
    ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
    patterns = {},
    fallback = true, -- Fallback to git when local plugin doesn't exist
  },
  profiling = {
    -- Enables extra stats on the debug tab related to the loader cache.
    -- Additionally gathers stats about all package.loaders
    loader = true,
    -- Track each new require in the Lazy profiling tab
    require = true,
  },
})
