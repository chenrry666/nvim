return {

  'neovim/nvim-lspconfig',
  opts = {
    ---@module "lspconfig"
    ---@type {[string]: lspconfig.Config|{}|fun(): lspconfig.Config}
    servers = {
      rustledger = {
        cmd = { 'rledger-lsp' },
        filetypes = { 'beancount' },
        root_dir = function(bufnr, on_dir)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          on_dir(require('lspconfig').util.root_pattern('.git', 'main.beancount', 'ledger.beancount')(fname))
        end,
        settings = {},
      },
    },
  },
}
