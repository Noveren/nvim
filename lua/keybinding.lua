-- 设置 <leader> 为 <space>
vim.g.mapleader      = " "
vim.g.maplocalleader = " "
-- 设置 快捷键 
local NORMAL = "n"
local INSERT = "i"
local map = function(mode, settings)
    local OPT = {
        noremap = true,
        silent  = true,
    }
    for old, new in pairs(settings) do
        vim.api.nvim_set_keymap(mode, new, old, OPT)
    end
end

map(NORMAL, {
    -- TODO 给 BufferLinePrev 和 BufferLineNext 添加快捷键, 插件覆盖了 gt 的功能
    -- TODO 如何配置插件载入后在设置快捷键绑定 
    -- TODO BufferLine 插件将 buffers 映射到 tabs, 因此 gt/gT 无效, 需要设置命令映射
    -- NvimTree
    [":NvimTreeToggle<CR>"] = "<C-\\>",
    -- nvim-cmp
    -- lsp
    [":lua vim.lsp.buf.definition()<CR>"]     = "gd",          -- 声明
    [":lua vim.lsp.buf.declaration()<CR>"]    = "gD",          -- 定义
    [":lua vim.lsp.buf.hover()<CR>"]          = "gh",          -- 提示
    [":lua vim.lsp.buf.implementation()<CR>"] = "gi",          -- 实现
    -- BufferLine

    -- TODO 整体上下移动行, 目前只支持 NORMAL 模式下, 上下移动单行
    [":m-2<CR>"] = "<C-UP>",
    [":m+1<CR>"] = "<C-DOWN>",
})
