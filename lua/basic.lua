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

set.background = "dark" 
vim.cmd("colorscheme gruvbox")

set.number = true

-- 缩进与 <tab>
set {
    tabstop     = 4,
    shiftwidth  = 4,
    expandtab   = true,
}

        
set.swapfile = true			-- swapfile
set.mouse    = ""           -- 鼠标模式

set.termguicolors = true    -- 允许 24-bits 颜色
