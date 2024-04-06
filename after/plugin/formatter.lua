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
        ts = {
            require("formatter.filetypes.typescript").prettier
        },
        json = {
            require("formatter.filetypes.json").prettier
        },
        html = {
            require("formatter.filetypes.html").prettier
        },
        css = {
            require("formatter.filetypes.css").prettier
        },
        md = {
            require("formatter.filetypes.markdown").prettier
        },
        scss = {
            require("formatter.filetypes.css").prettier
        },
        less = {
            require("formatter.filetypes.css").prettier
        },
        gql = {
            require("formatter.filetypes.graphql").prettier
        },
        yaml = {
            require("formatter.filetypes.yaml").prettier
        },
        tsx = {
            require("formatter.filetypes.typescriptreact").prettier
        },
        jsx = {
            require("formatter.filetypes.javascriptreact").prettier
        },
        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}