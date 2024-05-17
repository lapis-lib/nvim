local lspconfig = require 'lspconfig'

lspconfig.clangd.setup {
  -- cmake-tools
  on_new_config = function(new_config, new_cwd)
    local status, cmake = pcall(require, 'cmake-tools')
    if status then
      cmake.clangd_on_new_config(new_config)
    end
  end,
}
