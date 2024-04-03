lvim.plugins = {
  { "catppuccin/nvim" },
  { "rose-pine/neovim" },
  { "tpope/vim-surround" },
  {
    "folke/twilight.nvim",
    opts = {}
  },
  {
    "olimorris/persisted.nvim",
    lazy = false, -- make sure the plugin is always loaded at startup
    config = true
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require('neoscroll').setup {}
    end
  },
  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy", -- https://github.com/NvChad/nvim-colorizer.lua/issues/57
    -- event = { "BufReadPost", "BufNewFile" },
    opts = {
      user_default_options = {
        mode = "virtualtext",
        names = false,
      },
      filetypes = {
        "*",
        css = { names = true, css = true, css_fn = true },
      },
    },
  },
  {
    'AckslD/nvim-trevJ.lua',
    config = 'require("trevj").setup()',
    init = function()
      vim.keymap.set('n', '<leader>j', function()
        require('trevj').format_at_cursor()
      end)
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    "saecki/crates.nvim",
    opts = {},
    config = function()
      require('crates').setup()
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    event = "VeryLazy",
    lazy = true,
    dependencies = {
      { 'kkharji/sqlite.lua',           module = 'sqlite' },
      { 'nvim-telescope/telescope.nvim' },
    },
    config = function()
      require('telescope').load_extension('neoclip')
      require('neoclip').setup({
        enable_persistent_history = true,
      })
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
}
