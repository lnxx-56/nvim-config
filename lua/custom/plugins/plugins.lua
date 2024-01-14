local plugins = {
  {
    {'romgrk/barbar.nvim',
      dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
      },
      init = function() vim.g.barbar_auto_setup = false end,
      opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
      },
      version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },
    -- NOTE: First, some plugins that don't require any configuration
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    -- NOTE: This is where your plugins related to LSP can be installed.
    --  The configuration is done below. Search for lspconfig to find it below.
    { -- LSP Configuration & Plugins
      'neovim/nvim-lspconfig',
      dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', opts = {}, branch="legacy" },
        -- Additional lua configuration, makes nvim stuff amazing!
        'folke/neodev.nvim',
      },
    },
    { -- Autocompletion
      'hrsh7th/nvim-cmp',
      dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    },
    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim', opts = {} },
    { -- Adds git releated signs to the gutter, as well as utilities for managing changes
      'lewis6991/gitsigns.nvim',
      opts = {
        -- See `:help gitsigns.txt`
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      },
    },
    -- { -- Theme inspired by Atom
    --   'navarasu/onedark.nvim',
    --   priority = 1000,
    --   config = function()
    --     vim.cmd.colorscheme 'onedark'
    --   end,
    -- },
    { -- Set lualine as statusline
      'nvim-lualine/lualine.nvim',
      -- See `:help lualine.txt`
      opts = {
        options = {
          icons_enabled = false,
          -- theme = 'onedark',
          component_separators = '|',
          section_separators = '',
        },
      },
    },
    { -- Add indentation guides even on blank lines
      'lukas-reineke/indent-blankline.nvim',
      -- Enable `lukas-reineke/indent-blankline.nvim`
      -- See `:help indent_blankline.txt`
      opts = {
        char = '┊',
        show_trailing_blankline_indent = false,
      },
    },
    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },
    -- Fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
      config = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
      end,
    },
    -- Custom plugins section
    {
      'sindrets/diffview.nvim'
    },
    {
      'nvim-tree/nvim-tree.lua'
    },
    {
      'nvim-tree/nvim-web-devicons'
    },
    {
      'jose-elias-alvarez/typescript.nvim'
    },
    {
      'MunifTanjim/prettier.nvim' 
    },
    {
      'iamcco/coc-angular'
    },
    {
      'nvim-telescope/telescope-media-files.nvim'
    },
    {
      'nvim-lua/plenary.nvim'
    },
    {
      'nvim-pack/nvim-spectre'
    },
    {
      'folke/trouble.nvim'
    },
    {
      'rebelot/kanagawa.nvim'
    },
    {
      "iamcco/markdown-preview.nvim",
      ft = "markdown",
      cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
      build = function()
      vim.fn["mkdp#util#install"]()
      end,
    },
    { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
    -- debugger
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} },
    { "theHamsta/nvim-dap-virtual-text" }

  }
}
