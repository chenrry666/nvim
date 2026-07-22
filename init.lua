if vim.loader then vim.loader.enable() end -- enable vim.loader early if available

vim.env.PATH = vim.env.PATH .. ":"..(vim.fs.joinpath(vim.fn.stdpath("config"),"node_modules/.bin"))

require 'core.options'
require 'core.autocmds'
require 'core.package'

require 'core.keymap'

vim.schedule(function ()
  vim.cmd.colorscheme[[nightfox]]
end)
