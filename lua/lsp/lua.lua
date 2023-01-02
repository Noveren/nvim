require("lspconfig").sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                version = "Lua 5.1",
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    }
}
