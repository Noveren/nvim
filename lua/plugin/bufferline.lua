local PLUGIN = "bufferline"

local ok, plugin = pcall(require, PLUGIN)
if not ok then
    error("Failed to require " .. PLUGIN)
end

plugin.setup {
    options = {
        diagnostics = "nvim_lsp",               -- 使用内置 lsp
        offsets = {{
            filetype   = "NvimTree",
            text       = "Explorer",
            highlight  = "Directory",
            text_align = "left",
        }},
    }
}
