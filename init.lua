-- 打印环境模块
-- for i in pairs(_G.vim) do
--     print(i)
-- end

-- 基础配置
require("basic")
require("keybinding")

-- 插件加载
require("plugin.init")
require("plugin.nvim-tree")
require("plugin.bufferline")
require("plugin.lualine")

-- 语言服务器
-- lua require("lsp.init")
-- lua require("lsp.lua")


