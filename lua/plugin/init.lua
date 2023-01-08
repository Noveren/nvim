vim.cmd [[
    packadd packer.nvim
]]

local ok, packer = pcall(require, "packer")
if not ok then
    error("Failed to require Packer")
end

local prefix = {
    raw      = "https://",
    ghproxy  = "https://ghproxy.com/https://",
    gitclone = "https://gitclone.com/",
}

packer.init {
    git = {
        default_url_format = prefix.gitclone .. "github.com/%s",
    },
    display = {
        open_fn = function()
            return require("packer.util").float {
                border = "rounded",
            }
        end
    },
}

return packer.startup(function(use)
    -- Packer.nvim 插件管理器
    use "wbthomason/packer.nvim"
    -- comment 注释
    -- use {
    --     "numToStr/Comment.nvim",
    -- }
    -- 主题 gruvbox
    use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }
    -- nvim-tree 侧边栏文件树
    use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
    }
    -- bufferline 缓冲区 tab
    use {
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- 自动补全
    use {
        "hrsh7th/nvim-cmp",
        -- 代码片段引擎
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        -- 补全内容来源
        "hrsh7th/cmp-nvim-lsp",             -- 内置 LSP
        "hrsh7th/cmp-buffer",               -- 缓冲区内容
    }
    -- LSP 语言服务器
    use {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
    }
end)
