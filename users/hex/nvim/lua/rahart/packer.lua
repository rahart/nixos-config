local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use ("wbthomason/packer.nvim")
  -- Theme
  use ("folke/tokyonight.nvim")
    
  -- Navigation
  use ("christoomey/vim-tmux-navigator")
  -- File stuff
  use ("ThePrimeagen/harpoon")
  use ("nvim-lua/popup.nvim")
  use ("nvim-lua/plenary.nvim")
  use ("nvim-lua/telescope.nvim")
  use ("jremmen/vim-ripgrep")
  
  -- commenting
  use ("numToStr/Comment.nvim")
  -- file tree
  use ("nvim-tree/nvim-tree.lua")

  -- lsp
  use ("VonHeikemen/lsp-zero.nvim")
  use ("williamboman/mason.nvim")
  use ("williamboman/mason-lspconfig.nvim")
  use ("neovim/nvim-lspconfig")

  --autocopletion
  use ("hrsh7th/nvim-cmp")
  use ("hrsh7th/cmp-buffer")
  use ("hrsh7th/cmp-path")
  use ("saadparwaiz1/cmp_luasnip")
  use ("hrsh7th/cmp-nvim-lua")
  use ("hrsh7th/cmp-nvim-lsp")

    -- snippets
  use ("L3MON4D3/LuaSnip") 
  use("rafamadriz/friendly-snippets")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
