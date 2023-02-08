local load = require("utils").load

-- 通用配置
load "common"

-- 插件加载
load {
    main = "plugin.init",
    with = {
        "plugin.gruvbox",
        "plugin.nvim-tree",
        "plugin.bufferline",
        "plugin.lualine",
        "plugin.nvim-cmp"
    }
}

-- 语言服务器 ( 注释配置文件即为禁止相应的lsp启动 )
-- require("lsp.lua")
-- require("lsp.python")
