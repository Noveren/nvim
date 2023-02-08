vim.cmd [[
        set background=dark
        colorscheme gruvbox
    ]]

local utils = require("utils")
utils.set {
    -- 
    swapfile        = true,
    mouse           = "",
    termguicolors   = true,
    fileencoding    = "utf-8",
    -- 缩进与 <tab>
    autoindent  = true,
    smartindent = true,
    tabstop     = 4,
    shiftwidth  = 4,
    expandtab   = true,
    list        = true,
    listchars   = "space:.",
    -- 
    number         = true,
    relativenumber = false,
    wrap           = false,
    scrolloff      = 9,
    sidescrolloff  = 9,
    cursorline     = true,
    signcolumn     = "yes",
    -- 搜索
    ignorecase     = false,
    smartcase      = false,
}