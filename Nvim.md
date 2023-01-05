Neovim 配置文件有默认路径（如下），同时通过由环境变量 `XDG_CONFIG_HOME`指向 nvim 路径所在的根路径

```shell
Unix    ~/.config/nvim/init.vim
Windows ~/AppData/Local/nvim/init.vim
```
test
Neovim 配置目录结构规定如下

```shell
- nvim\							# 配置目录
	- init.vim					# 入口文件
	- lua\						# lua 配置脚本
		- <file_name>.lua		# 自定义配置
```

```vim
" init.vim 文件结构，支持并拓展了 vimscript 语法，目前推荐将其作为 lua 配置脚本载入器
lua <单行脚本>
lua <<EOF
	<多行脚本>
EOF
```

+   入口文件中 `require('<file_name>')` 以 `lua` 为根路径，根据 **文件名** 或 **路径文件名**，导入自定义配置脚本

## Lua 配置接口

>   在 Neovim 的 Lua 配置环境中提供了全局模块 `vim`，通过该模块可以访问 Neovim 的配置

|  子空间   |      说明      |
| :-------: | :------------: |
|  `vim.o`  |      常规      |
| `vim.wo`  |   窗口作用域   |
| `vim.bo`  |  缓冲区作用域  |
|  `vim.g`  |    全局变量    |
| `vim.env` |    环境变量    |
| `vim.opt` | 存放通用配置项 |

## 插件支持

### 1. 插件管理器 packer.nvim

```shell
# Unix
~/.local/share/nvim/site/pack/packer/start
# Window
$LOCALAPPDATA/nvim-data/site/pack/packer/start
```

+   Neovim 的插件位于上述目录，手动克隆 `wbthomason/packer.nvim` 至上述 start 路径下，完成安装

```lua
-- plugin/init.lua
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
end)
```

+   安装或更新管理插件：填写 `use`、重启 neovim、执行 `:PackerSync` 命令

```shell
:PackerUpdate
:PackerCompile
:PackerClean					# 清除不可使用或未使用的插件
:PackerSync						# 安装或更新
```

### 2. 主题 gruvbox

```lua
-- gruvbox 主题
use {
    "ellisonleao/gruvbox.nvim",
    requires = {"rktjmp/lush.nvim"}
}
```

```lua
vim.opt.background = "dark"
vim.cmd("colorscheme gruvbox")
```

### 3. 侧边栏文件树 nvim-tree

```lua
-- nvim-tree 侧边栏文件树
use {
    "kyazdani42/nvim-tree.lua",
    requires = 'kyazdani42/nvim-web-devicons',
}
```

需要特殊字体

### 4. 缓冲区 Tab bufferline

### 5. 状态栏 lualine

## LSP

```lua
-- LSPconfig
use {
	"neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer"
}
```

