vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.swapfile = false
vim.opt.wrap = false

vim.opt.termguicolors = true
vim.opt.background = "dark"

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
Plug 'folke/flash.nvim'
Plug 'neovim/nvim-lspconfig'
call plug#end()
]])

-- Telescope setup
require('telescope').setup{}

-- LSP setup (only load if lspconfig is available)
local ok, lspconfig = pcall(require, 'lspconfig')
if ok then
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

  -- Enable common language servers (install with your system package manager)
  local servers = { 'lua_ls', 'pyright', 'ts_ls' }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({})
  end
end

require("keymaps")
