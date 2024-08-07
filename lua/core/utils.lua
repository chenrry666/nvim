local M = {
  opts = {},
}

--- Call function if a condition is met
---@param func function The function to run
---@param condition boolean # Whether to run the function or not
---@return any|nil result # the result of the function running or nil
function M.conditional_func(func, condition, ...)
  -- if the condition is true or no condition is provided, evaluate the function with the rest of the parameters and return the result
  if condition and type(func) == 'function' then return func(...) end
end

---map keys
---@example
---  map('n', '<C-N>', '<cmd>bnext<CR>', { desc = 'Next buf' })
---@param mode 'v'|'n'|'i'|'t'|'c'|'x'|'o'|table
---@param lhs string
---@param rhs any
---@param opts? vim.keymap.set.Opts
function M.map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, vim.tbl_deep_extend('force', M.opts, opts or {}))
end

---set opts for the rest operations
---@param opt vim.keymap.set.Opts
function M.map_opt(opt)
  M.opts = opt
end

function M.event(ev)
  vim.schedule(function()
    vim.api.nvim_exec_autocmds('User', { pattern = ev })
  end)
end

--- A helper function to wrap a module function to require a plugin before running
---@param plugin string the plugin string to call `require("lazy").load` with
---@param module any the system module where the functions live (e.g. `vim.ui`)
---@param func_names table|string a string or a list like table of strings for functions to wrap in the given module (e.g. `{ "ui", "select }`)
function M.load_plugin_with_func(plugin, module, func_names)
  if type(func_names) == 'string' then func_names = { func_names } end
  for _, func in ipairs(func_names) do
    module[func] = function(...)
      require('lazy').load { plugins = { plugin } }
      module[func](...)
    end
  end
end

--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yet
---@param plugin string The plugin to search for
---@return boolean available # Whether the plugin is available
function M.has(plugin)
  local lazy_config_avail, lazy_config = pcall(require, 'lazy.core.config')
  return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end

function M.augroup(name)
  vim.api.nvim_create_augroup('User' .. name, { clear = true })
end

function M.autocmd(...)
  vim.api.nvim_create_autocmd(...)
end

return M
