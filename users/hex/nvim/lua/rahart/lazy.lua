local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Theme
  -- "folke/tokyonight.nvim",
{ 
  'olivercederborg/poimandres.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('poimandres').setup {
      -- leave this setup function empty for default config
      -- or refer to the configuration section
      -- for configuration options
    }
  end,

  -- optionally set the colorscheme within lazy config
  init = function()
    vim.cmd("colorscheme poimandres")
  end
},

  -- Tim Pope stuff
  "tpope/vim-fugitive",
  "tpope/vim-surround",

  -- Navigation
  "christoomey/vim-tmux-navigator",
  -- File stuff
  "ThePrimeagen/harpoon",

  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-lua/telescope.nvim",
  "jremmen/vim-ripgrep",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- commenting
  "numToStr/Comment.nvim",
  -- file tree
  "nvim-tree/nvim-tree.lua",

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
    },
  },

  -- lualine
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'poimandres',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- lsp
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_exteend_lspconfig = 0
    end
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },

  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end,opts)
        vim.keymap.set("n", "K", function () vim.lsp.buf.hover() end,opts)
        vim.keymap.set("n", "<leader>vws", function () vim.lsp.buf.workspace_symbol() end,opts)
        vim.keymap.set("n", "<leader>vd", function () vim.lsp.buf.open_float() end,opts)
        vim.keymap.set("n", "[d", function () vim.lsp.buf.goto_next() end,opts)
        vim.keymap.set("n", "]d", function () vim.lsp.buf.goto_prev() end,opts)
        vim.keymap.set("n", "<leader>vca", function () vim.lsp.buf.code_action() end,opts)
        vim.keymap.set("n", "<leader>vrr", function () vim.lsp.buf.references() end,opts)
        vim.keymap.set("n", "<leader>vrn", function () vim.lsp.buf.rename() end,opts)
        vim.keymap.set("i", "<C-h>", function () vim.lsp.buf.signature_help() end,opts)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })
    end
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()
      local luasnip = require('luasnip')
      require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/snippets/"})
      luasnip.config.setup {}

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = 'buffer' },
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      })
    end
  },

  -- Copilot
  "github/copilot.vim",

  -- notes
  -- use {'nvim-orgmode/orgmode', config = function()
  --   require('orgmode').setup{}
  -- end
  -- }
  -- use {
  --   'renerocksai/telekasten.nvim',
  --   requires = {'nvim-telescope/telescope.nvim'}
  -- }
  { "vimwiki/vimwiki", init = function()
      vim.g.vimwiki_list = {{
          path = "/Users/travisharrington/brain",
          syntax = "markdown",
          ext = ".md",
          links_space_char = "_",
          auto_diary_index = 1,
          diary_rel_path = "daylog/",
          diary_index = "daylog",
          diary_header = "Daylog",
      }}
      vim.g.vimwiki_ext2syntax = {
        [".md"] = "markdown",
        [".markdown"] = "markdown",
        [".mdown"] = "markdown",
      }
    end
  }
})
