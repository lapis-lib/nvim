require 'lapis-lib/remap'
require 'lapis-lib/set'
require 'lapis-lib/theme'

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
      require('oil').setup()
    end,
  },
  -- {
  --   'WENLIXIAO-CS/vim-matlab',
  --   dependencies = { 'honza/vim-snippets', 'garbas/vim-snipmate', 'marcweber/vim-addon-mw-utils' },
  -- },
  {
    'Civitasv/cmake-tools.nvim',
    config = function()
      require 'lapis-lib.configs.cmake'
    end,
    lazy = false,
  },
}
