require("bufferline").setup {
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
