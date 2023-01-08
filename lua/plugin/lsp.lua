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
    -- 管理面板
    ui = {
        check_outdated_packages_on_open = false,    -- 检查更新
        border = "none",
        icons = {
            package_installed   = "✓",
            package_pending     = "➜",
            package_uninstalled = "✗",
        },
        -- keymaps = {
        -- },  
    },
}

require("mason-lspconfig").setup {
    -- 需要安装的 lsp 包, 包名查看 mason-lspconfig/README.md
    ensure_installed = {
        "sumneko_lua",              -- lua
        "pylsp",                    -- python
        "ruff_lsp",                 -- python
    },
}
