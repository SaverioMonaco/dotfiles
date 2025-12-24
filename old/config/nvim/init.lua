vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Disable all LSP client auto-start
vim.lsp.set_log_level("off")

-- Prevent Neovim from starting LSP clients entirely
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then client.stop() end
  end,
})

if vim.g.vscode then
  vim.api.nvim_exec([[
      " THEME CHANGER
      function! SetCursorLineNrColorInsert(mode)
          " Insert mode: blue
          if a:mode == "i"
              call VSCodeNotify('nvim-theme.insert')

          " Replace mode: red
          elseif a:mode == "r"
              call VSCodeNotify('nvim-theme.replace')
          endif
      endfunction

      augroup CursorLineNrColorSwap
          autocmd!
          autocmd ModeChanged *:[vV\x16]* call VSCodeNotify('nvim-theme.visual')
          autocmd ModeChanged *:[R]* call VSCodeNotify('nvim-theme.replace')
          autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
          autocmd InsertLeave * call VSCodeNotify('nvim-theme.normal')
          autocmd CursorHold * call VSCodeNotify('nvim-theme.normal')
          autocmd ModeChanged [vV\x16]*:* call VSCodeNotify('nvim-theme.normal')
      augroup END
  ]], false)
end
