lvim.plugins = {
  { 'catppuccin/nvim' },
  { 'rose-pine/neovim' },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { 'nvim-pack/nvim-spectre' },
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow"
  },
  {
    'folke/twilight.nvim',
    opts = {}
  },
  {
    'folke/zen-mode.nvim',
    opts = {}
  },
  {
    'j-hui/fidget.nvim',
    opts = {},
  },
  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
  },
  {
    'olimorris/persisted.nvim',
    lazy = false,
    config = true
  },
  {
    'nvim-telescope/telescope-frecency.nvim',
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup {}
    end
  },
  {
    'folke/todo-comments.nvim',
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end
  },
  {
    'folke/trouble.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    'AckslD/nvim-trevJ.lua',
    config = function()
      require('trevj').setup()
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
  },
  {
    'NvChad/nvim-colorizer.lua',
    event = "VeryLazy", -- https://github.com/NvChad/nvim-colorizer.lua/issues/57
    -- event = { "BufReadPost", "BufNewFile" },
    opts = {
      user_default_options = {
        mode = "background",
        names = false,
      },
      filetypes = {
        "*",
        css = { names = true, css = true, css_fn = true },
      },
    },
  },

  {
    'AckslD/nvim-neoclip.lua',
    event = "VeryLazy",
    lazy = true,
    dependencies = {
      {
        'kkharji/sqlite.lua',
        module = 'sqlite'
      },
      { 'nvim-telescope/telescope.nvim' },
    },
    config = function()
      require('telescope').load_extension('neoclip')
      require('neoclip').setup({
        enable_persistent_history = true,
      })
    end,
  },
}
