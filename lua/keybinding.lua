-- 设置 <leader> 为 <space>
vim.g.mapleader     = " "
vim.gmaplocalleader = " "
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
    -- BufferLine
    [":BufferLineCyclePrev<CR>"] = "gt",
    [":BufferLineCycleNext<CR>"] = "gT",
})
