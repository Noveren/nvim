vim.cmd [[
    packadd packer.nvim
]]

local ok, packer = pcall(require, "packer")
if not ok then
    error("Failed to require Packer")
end

packer.init {
    git = {
        -- github clone 代理 ghproxy.com
        default_url_format = "https://ghproxy.com/https://github.com/%s",
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
    -- gruvbox 主题
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
    -- LSP 语言服务器
    use {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
    }
end)
