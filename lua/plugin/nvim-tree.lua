-- nvim-tree 插件配置文件
local PLUGIN = "nvim-tree"

local ok, plugin = pcall(require, PLUGIN)
if not ok then
    error("Failed to require " .. PLUGIN)
end

plugin.setup {
   git = {
       enable = true
   },
}
