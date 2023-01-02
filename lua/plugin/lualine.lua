local PLUGIN = "lualine"
local ok, plugin = pcall(require, PLUGIN)
if not ok then
    error("Failed to require " .. PLUGIN)
end
plugin.setup {
    options = {
        theme         = "gruvbox",
        icons_enabled = true,
    }
}
