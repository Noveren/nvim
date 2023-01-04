-- 配置器 ==================================================
local set = {}
setmetatable(set, {
    __call = function(_, settings)
        for k, v in pairs(settings) do
            if vim.opt[k] ~= nil then
                vim.opt[k] = v
            end
        end
    end,
    __newindex = function(_, k, v)
        vim.opt[k] = v
    end
})

-- 配置项 ==================================================
set.background = "dark"
vim.cmd("colorscheme gruvbox")

-- 缩进与 <tab>
set {
    autoindent  = true,
    smartindent = true,
    tabstop     = 4,
    shiftwidth  = 4,
    expandtab   = true,     -- 使用空格作为缩进
    list        = true,     -- 开启不可见字符显示
    listchars   = "space:.",
}

set.swapfile = true         -- swapfile
set.mouse    = ""           -- 鼠标模式

set.termguicolors = true    -- 允许 24-bits 颜色

set.fileencoding = "utf-8"  -- 文件编码格式

set {
    number         = true,
    relativenumber = false,
    wrap           = false,
    scrolloff      = 9,      -- 行自动偏移
    sidescrolloff  = 9,      -- 列自动偏移
    cursorline     = true,   -- 高亮鼠标所在行
    signcolumn     = "yes",  -- 行图标指示列
}
