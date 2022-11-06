local o = vim.o
local g = vim.g

vim.scriptencoding = 'utf-8'
o.fileencodings = 'utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,latin1'
o.encoding = 'utf-8'

o.number = true
o.relativenumber = true
o.ignorecase = true
o.smartcase = true
o.undofile = false
o.swapfile = false
o.scrolloff = 5
o.sidescrolloff = 5

o.maxmempattern = 2000 -- max match pattern
o.autochdir = true -- auto change directory to current file
o.autoread = true
o.lazyredraw = true -- true will speed up in macro repeat
o.ttyfast = true -- true maybe as lazyredraw ? TODO

o.wrap = false
o.mouse = 'a'
o.hidden = true
o.termguicolors = true

o.path = o.path .. ',./**'

o.tabstop = 2 -- replace tab as white space
o.expandtab = true
o.shiftwidth = 2
o.softtabstop = 2

o.conceallevel = 2
o.concealcursor = '' -- if set to nc char will always fold except in insert mode

o.foldenable = true -- enable fold
o.foldlevel = 99 -- disable fold for opened file
o.foldminlines = 2 -- 0 means even the child is only one line fold always works
o.foldmethod = 'expr' -- for most filetype fold by syntax
o.foldnestmax = 5 -- max fold nest

-- Clipboard
o.clipboard = 'unnamedplus'

o.completeopt = {'menu','menuone','noselect'}
o.colorcolumn = '99999' -- FIXED: for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59

-- Leader/local leader
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

-- Skip some remote provider loading
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Use new filetype.lua instead of old filtype.vim because it's slow
g.do_filetype_lua = 1 
g.did_load_filetypes = 0 

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip',
  'man',
  'matchit',
  'matchparen',
  'shada_plugin',
  'tarPlugin',
  'tar',
  'zipPlugin',
  'zip',
  --  'netrwPlugin',
}

for i = 1, #disabled_built_ins do
  g['loaded_' .. disabled_built_ins[i]] = 1
end
