local utils = require("utils")

utils.set {
    shortmess       = "atI",
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

-- 设置 <leader> 为 <space>
vim.g.mapleader      = " "
vim.g.maplocalleader = " "