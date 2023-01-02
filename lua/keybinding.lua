-- 设置 <leader> 为 <space>
vim.g.mapleader     = " "
vim.g.maplocalleader = " "
-- 设置 快捷键 
local NORMAL = "n"
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
    -- NvimTreeToggle
    [":NvimTreeToggle<CR>"] = "<C-\\>",
    -- lsp
    [":lua vim.lsp.buf.definition()<CR>"]     = "gd",          -- 声明
    [":lua vim.lsp.buf.declaration()<CR>"]    = "gD",          -- 定义
    [":lua vim.lsp.buf.hover()<CR>"]          = "gh",          -- 提示
    [":lua vim.lsp.buf.implementation()<CR>"] = "gi",          -- 实现
})
