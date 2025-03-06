-- local prettier = { exe = 'prettier', args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, stdin = true }
local prettier = require "formatter.defaults.prettier"
local clang_format = require "formatter.defaults.clangformat"

-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    c = { clang_format },
    cpp = { clang_format },
    javascript = { prettier },
    typescript = { prettier },
    json = { prettier },
    html = { prettier },
    css = { prettier },
    markdown = { prettier },
    graphql = { prettier },
    yaml = { prettier },
    typescriptreact = { prettier },
    javascriptreact = { prettier },
    scss = { prettier },
    less = { prettier },
    ["javascript.jsx"] = { prettier },
    ["typescript.tsx"] = { prettier },
    ["vue"] = { prettier },
    ["svelte"] = { prettier },
    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
  group = "__formatter__",
  command = ":FormatWrite",
})

vim.api.nvim_set_keymap('n', '<leader>f', ':Format<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>F', ':FormatWrite<CR>', { noremap = true, silent = true })
