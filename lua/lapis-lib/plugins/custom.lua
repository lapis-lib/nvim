require 'lapis-lib.mappings'
require 'lapis-lib.set'
require 'lapis-lib.theme'

return {
  {
    -- nvim implementation of orgmode
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    config = function()
      -- Setup orgmode
      require('orgmode').setup {
        org_agenda_files = 'N:/orgmode/**/*',
        org_default_notes_file = 'N:/orgmode/refile.org',
        org_todo_keyword_faces = {
          TODO = ':foreground #bd8183',
          DONE = ':foreground #78997a',
        },
        -- set first day of the week to Sunday
        calendar_week_start_day = 0,
        org_agenda_start_day = '-1d',
        org_startup_indented = true,
      }
    end,
  },
  {
    -- add bullets to orgmode
    'akinsho/org-bullets.nvim',
    event = 'VeryLazy',
    config = function()
      require('org-bullets').setup {
        symbols = {
          checkboxes = {
            done = { '✓', 'OrgDone' },
            todo = { ' ', 'OrgTODO' },
          },
        },
      }
    end,
  },
  {
    -- add tables to nvim
    'dhruvasagar/vim-table-mode',
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
    end,
  },
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'toha-heavy-industries',
          path = 'N:/toha-heavy-industries',
        },
      },
      templates = {
        subdir = 'survey-desk/blueprints',
      },
    },
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'lapis-lib.configs.oil'
    end,
  },
  {
    'WENLIXIAO-CS/vim-matlab',
    -- dependencies = { 'honza/vim-snippets', 'garbas/vim-snipmate', 'marcweber/vim-addon-mw-utils' },
  },
  {
    'Civitasv/cmake-tools.nvim',
    config = function()
      require 'lapis-lib.configs.cmake'
    end,
    lazy = false,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require 'lapis-lib.configs.lualine'
    end,
  },
  {
    'stevearc/overseer.nvim',
    opts = {},
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = 10,
      open_mapping = '<C-s>',
    },
  },
  {
    'zane-/cder.nvim',
    -- require('telescope').load_extension 'cder',
  },
  {
    'windwp/nvim-autopairs',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup {}
    end,
  },
  {
    'ibhagwan/smartyank.nvim',
    config = function()
      require('smartyank').setup {
        clipboard = {
          enabled = true,
        },
      }
    end,
  },
}
