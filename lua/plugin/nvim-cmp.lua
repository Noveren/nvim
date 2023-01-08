local cmp = require("cmp")

cmp.setup {
    -- 代码片段引擎 vsnip
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    -- 补全内容源
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip"    },
    }, {
        { name = "buffer"   },
    }),
    -- 按键映射
    mapping = cmp.mapping.preset.insert {
        -- 仅在补全窗口出现时才有效的按键映射
        ["<Esc>"]  = cmp.mapping.abort(),
        ["<Tab>"]   = cmp.mapping.confirm({ select = true }),
        ["<Up>"]   = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
    },
}
