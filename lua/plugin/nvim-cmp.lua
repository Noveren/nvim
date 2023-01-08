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
}
