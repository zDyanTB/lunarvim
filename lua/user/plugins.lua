lvim.plugins = {

  -- Colorschemes -------------------
  { 'catppuccin/nvim' },
  { 'sontungexpt/witch' },
  { 'rose-pine/neovim' },
  { 'olivercederborg/poimandres.nvim' },
  { 'antonio-hickey/citrus-mist' },
  { 'diegoulloao/neofusion.nvim' },

  -- Plugins ------------------------
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { 'nvim-pack/nvim-spectre' }, -- Find the enemy and replace them with dark power
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  {
    "nvchad/menu",
    dependencies = { "nvchad/volt" },
    lazy = true
  },
  {
    'folke/twilight.nvim', -- Twilight is a Lua plugin for Neovim that dims inactive portions of the code you're editing using TreeSitter
    opts = {}
  },
  {
    'folke/zen-mode.nvim', -- Distraction-free coding for Neovim
    opts = {}
  },
  {
    'j-hui/fidget.nvim', -- 💫 Extensible UI for Neovim notifications and LSP progress messages
    opts = {},
  },
  {
    'jake-stewart/multicursor.nvim',
    branch = "1.0",
  },
  {
    'smoka7/hop.nvim', -- Neovim motions on speed!
    config = true,
    version = "*",
    opts = {},
  },
  {
    "atlj/Pixie.nvim", -- This NeoVim plugin generates ✨fancy✨ images from your code
    config = function()
      vim.cmd.PixieInstall()
    end
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },
  {
    'nvim-telescope/telescope-frecency.nvim', -- A telescope.nvim extension that offers intelligent prioritization when selecting files from your editing history
    config = function()
      require("telescope").load_extension('frecency')
    end,
  },
  {
    'folke/trouble.nvim', -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    cmd = "Trouble"
  },
  {
    'dstein64/nvim-scrollview', -- A Neovim plugin that displays interactive vertical scrollbars and signs
    opts = { diagnostics_severities = { vim.diagnostic.severity.ERROR } },
    config = true,
  },
  {
    'folke/todo-comments.nvim', -- Highlight, list and search todo comments in your projects
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    'AckslD/nvim-trevJ.lua', -- Nvim-plugin for doing the opposite of join-line (J) of arguments, powered by treesitter
    event = 'VeryLazy',
    config = true
  },
  {
    'karb94/neoscroll.nvim', -- Smooth scrolling neovim plugin written in lua
    config = true
  },
  {
    "kylechui/nvim-surround", -- Add/change/delete surrounding delimiter pairs with ease
    -- version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = true
  },
  {
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    cmd = "Markview",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    }
  },
  -- {
  --   "michaelb/sniprun",
  --   branch = "master",

  --   build = "sh install.sh",
  --   -- do 'sh install.sh 1' if you want to force compile locally
  --   -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

  --   config = function()
  --     require("sniprun").setup({
  --       -- your options
  --     })
  --   end,
  -- },
  {
    "saecki/crates.nvim",
    tag = "stable",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
        popup = {
          border = "rounded",
        },
      }
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      fps = 60,
      timeout = 3000,
      stages = "slide",
    }
  },
  {
    "folke/noice.nvim", -- 💥 Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu
    event = "VeryLazy",
    opts = {},
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    presets = { lsp_doc_border = true },
    config = function()
      require('noice').setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
      })
    end,
  },
  {
    'NvChad/nvim-colorizer.lua', -- The fastest Neovim colorizer
    event = 'VeryLazy',          -- https://github.com/NvChad/nvim-colorizer.lua/issues/57
    config = true,
    -- event = { "BufReadPost", "BufNewFile" },
    opts = {
      user_default_options = {
        mode = "background",
        names = false,
      },
      filetypes = {
        '*',
        css = {
          names = true,
          css = true,
          css_fn = true,
          rgb_fn = true,
        },
      },
    },
  },
  -- {
  --   'AckslD/nvim-neoclip.lua', -- Clipboard manager neovim plugin with telescope integration
  --   event = "VeryLazy",
  --   lazy = true,
  --   dependencies = {
  --     {
  --       'kkharji/sqlite.lua',
  --       module = 'sqlite',
  --     },
  --     { 'nvim-telescope/telescope.nvim' },
  --     { 'ibhagwan/fzf-lua' },
  --   },
  --   config = function()
  --     require('telescope').load_extension('neoclip')
  --     require('neoclip').setup({
  --       enable_persistent_history = true,
  --   end,
  -- },
}
