vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.list = true
vim.opt.listchars = {
  space = "·",
  tab = "→ ",
  trail = "·",
  extends = "»",
  precedes = "«",
}


vim.cmd([[
  highlight Normal guifg=#00ff00 guibg=#000000
  highlight Comment guifg=#008800 guibg=NONE
  highlight LineNr guifg=#005500
  highlight CursorLineNr guifg=#00ff00
]])

-- Auto-install vim-plug
local vim_plug_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(vim_plug_path)) > 0 then
  vim.fn.system({'curl', '-fLo', vim_plug_path, '--create-dirs', 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
  vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

-- Plugins
vim.cmd([[
call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-surround'
Plug 'folke/flash.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
call plug#end()
]])

-- Telescope setup
require('telescope').setup{}

-- nvim-tree setup
local ok_tree, nvim_tree = pcall(require, 'nvim-tree')
if ok_tree then
  nvim_tree.setup({
    disable_netrw = false,
    hijack_netrw = false,
    view = {
      width = 30,
      side = "left",
    },
    renderer = {
      icons = {
        show = {
          file = false,
          folder = false,
          folder_arrow = false,
          git = false,
        },
      },
    },
  })
end

-- LSP setup using vim.lsp.config (Neovim 0.11+)
-- Common LSP keybinds
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})

-- Enable common language servers using vim.lsp.config
vim.lsp.config.lua_ls = {}
vim.lsp.config.pyright = {}
vim.lsp.config.ts_ls = {}

require("keymaps")
