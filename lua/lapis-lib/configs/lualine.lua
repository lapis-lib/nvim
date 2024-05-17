-- --- @param trunc_width number trunctates component when screen width is less then trunc_width
-- --- @param trunc_len number truncates component to trunc_len number of chars
-- --- @param hide_width number hides component when window width is smaller then hide_width
-- --- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
-- --- return function that can format the component accordingly
-- local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
--   return function(str)
--     local win_width = vim.fn.winwidth(0)
--     if hide_width and win_width < hide_width then
--       return ''
--     elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
--       return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
--     end
--     return str
--   end
-- end
--
-- require('lualine').setup {
--   lualine_a = {
--     { 'mode', fmt = trunc(80, 4, nil, true) },
--     { 'filename', fmt = trunc(90, 30, 50) },
--     {
--       function()
--         return require('lsp-status').status()
--       end,
--       fmt = trunc(120, 20, 60),
--     },
--   },
-- }

local lualine = require 'lualine'

local cmake = require 'cmake-tools'

-- you can find the icons from https://github.com/Civitasv/runvim/blob/master/lua/config/icons.lua
local icons = require 'lapis-lib.configs.icons'

-- Credited to [evil_lualine](https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua)
local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand '%:t') ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand '%:p:h'
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local colors = {
  normal = {
    bg = '#202328',
    fg = '#bbc2cf',
    yellow = '#ecbe7b',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#98be65',
    orange = '#ff8800',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    blue = '#51afef',
    red = '#ec5f67',
  },
  nightfly = {
    bg = '#011627',
    fg = '#acb4c2',
    yellow = '#ecc48d',
    cyan = '#7fdbca',
    darkblue = '#82aaff',
    green = '#21c7a8',
    orange = '#e3d18a',
    violet = '#a9a1e1',
    magenta = '#ae81ff',
    blue = '#82aaff ',
    red = '#ff5874',
  },
  light = {
    bg = '#f6f2ee',
    fg = '#3d2b5a',
    yellow = '#ac5402',
    cyan = '#287980',
    darkblue = '#2848a9',
    green = '#396847',
    orange = '#a5222f',
    violet = '#8452d5',
    magenta = '#6e33ce',
    blue = '#2848a9',
    red = '#b3434e',
  },
  catppuccin_mocha = {
    bg = '#1e1e2e',
    fg = '#cdd6f4',
    yellow = '#f9e2af',
    cyan = '#7fdbca',
    darkblue = '#89b4fa',
    green = '#a6e3a1',
    orange = '#e3d18a',
    violet = '#a9a1e1',
    magenta = '#ae81ff',
    blue = '#89b4fa',
    red = '#f38ba8',
  },
  melange = {
    bg = '#292522',
    fg = '#ece1d7',
    bright_black = '#867462',
    bright_blue = '#a3a9ce',
    bright_cyan = '#89b3b6',
    bright_green = '#85b695',
    bright_magenta = '#cf9bc2',
    bright_red = '#d47766',
    bright_white = '#ece1d7',
    bright_yellow = '#ebc06d',
    dark_black = '#292522',
    dark_blue = '#273142',
    dark_cyan = '#253333',
    dark_green = '#233524',
    dark_magenta = '#422741',
    dark_red = '#7d2a2f',
    dark_white = '#403a36',
    dark_yellow = '#8b7449',
    black = '#34302c',
    blue = '#7f91b2',
    cyan = '#7b9695',
    green = '#78997a',
    magenta = '#b380b0',
    red = '#bd8183',
    white = '#c1a78e',
    yellow = '#e49b5d',
  },
}

colors = colors.melange

local config = {
  options = {
    icons_enabled = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    -- disabled_filetypes = { 'alpha', 'dashboard', 'Outline' },
    always_divide_middle = true,
    theme = 'auto',
    --[[ theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = {
        a = { bg = colors.bg, fg = colors.fg, gui = 'bold' },
        b = { bg = colors.bg, fg = colors.white },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
        b = { bg = colors.bg, fg = colors.white },
        c = { bg = colors.bg, fg = colors.white },
      },
      visual = {
        a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
        b = { bg = colors.bg, fg = colors.white },
        c = { bg = colors.bg, fg = colors.black },
      },
      replace = {
        a = { bg = colors.red, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightfg, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      command = {
        a = { bg = colors.green, fg = colors.black, gui = 'bold' },
        b = { bg = colors.bg, fg = colors.white },
        c = { bg = colors.bg, fg = colors.black },
      },
      inactive = {
        a = { bg = colors.bg, fg = colors.fg, gui = 'bold' },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
    }, ]]
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    local c_preset = cmake.get_configure_preset()
    return 'CMake: [' .. (c_preset and c_preset or 'X') .. ']'
  end,
  icon = icons.ui.Search,
  cond = function()
    return cmake.is_cmake_project() and cmake.has_cmake_preset()
  end,
  on_click = function(n, mouse)
    if n == 1 then
      if mouse == 'l' then
        vim.cmd 'CMakeSelectConfigurePreset'
      end
    end
  end,
}

ins_left {
  function()
    local type = cmake.get_build_type()
    return 'CMake: [' .. (type and type or '') .. ']'
  end,
  icon = icons.ui.Search,
  cond = function()
    return cmake.is_cmake_project() and not cmake.has_cmake_preset()
  end,
  on_click = function(n, mouse)
    if n == 1 then
      if mouse == 'l' then
        vim.cmd 'CMakeSelectBuildType'
      end
    end
  end,
}

ins_left {
  function()
    local kit = cmake.get_kit()
    return '[' .. (kit and kit or 'X') .. ']'
  end,
  icon = icons.ui.Pencil,
  cond = function()
    return cmake.is_cmake_project() and not cmake.has_cmake_preset()
  end,
  on_click = function(n, mouse)
    if n == 1 then
      if mouse == 'l' then
        vim.cmd 'CMakeSelectKit'
      end
    end
  end,
}

ins_left {
  function()
    return 'Build'
  end,
  icon = icons.ui.Gear,
  cond = cmake.is_cmake_project,
  on_click = function(n, mouse)
    if n == 1 then
      if mouse == 'l' then
        vim.cmd 'CMakeBuild'
      end
    end
  end,
}

ins_left {
  function()
    local b_preset = cmake.get_build_preset()
    return '[' .. (b_preset and b_preset or 'X') .. ']'
  end,
  icon = icons.ui.Search,
  cond = function()
    return cmake.is_cmake_project() and cmake.has_cmake_preset()
  end,
  on_click = function(n, mouse)
    if n == 1 then
      if mouse == 'l' then
        vim.cmd 'CMakeSelectBuildPreset'
      end
    end
  end,
}

ins_left {
  function()
    local b_target = cmake.get_build_target()
    return '[' .. (b_target and b_target or 'X') .. ']'
  end,
  cond = cmake.is_cmake_project,
  on_click = function(n, mouse)
    if n == 1 then
      if mouse == 'l' then
        vim.cmd 'CMakeSelectBuildTarget'
      end
    end
  end,
}

ins_left {
  function()
    return icons.ui.Debug
  end,
  cond = cmake.is_cmake_project,
  on_click = function(n, mouse)
    if n == 1 then
      if mouse == 'l' then
        vim.cmd 'CMakeDebug'
      end
    end
  end,
}

ins_left {
  function()
    return icons.ui.Run
  end,
  cond = cmake.is_cmake_project,
  on_click = function(n, mouse)
    if n == 1 then
      if mouse == 'l' then
        vim.cmd 'CMakeRun'
      end
    end
  end,
}

ins_left {
  function()
    local l_target = cmake.get_launch_target()
    return '[' .. (l_target and l_target or 'X') .. ']'
  end,
  cond = cmake.is_cmake_project,
  on_click = function(n, mouse)
    if n == 1 then
      if mouse == 'l' then
        vim.cmd 'CMakeSelectLaunchTarget'
      end
    end
  end,
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
-- ins_left {
--   function()
--     return '%='
--   end,
-- }

lualine.setup(config)
