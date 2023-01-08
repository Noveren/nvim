local prefix = {
    raw      = "https://",
    ghproxy  = "https://ghproxy.com/https://",
    gitclone = "https://gitclone.com/",
}

require("mason").setup {
    -- lsp 包安装路径
    install_root_dir = vim.fn.stdpath("data") .. "/mason",
    -- github 包下载模板
    github = {
        download_url_template = prefix.ghproxy .. "github.com/%s/releases/download/%s/%s",
    },
    ui = {
        border = "none",
        icons = {
            package_installed   = "✓",
            package_pending     = "➜",
            package_uninstalled = "✗",
        },
    },
}

require("mason-lspconfig").setup {
    -- 需要安装的 lsp 包, 包名查看 mason-lspconfig/README.md
    ensure_installed = {
        "sumneko_lua",              -- lua
    },
}
