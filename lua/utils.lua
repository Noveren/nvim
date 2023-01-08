local utils = {}

-- maps = {
--     { "lhs: string", "rhs: string | function"[, "opt: table"] }, 
-- }
-- utils.map = function(maps)
--     local DEFAULT_OPT = {
--         noremap = true,
--         silent  = true,
--     }
-- end

utils.set = {}
setmetatable(utils.set, {
    __call = function(_, settings)
        for k, v in pairs(settings) do
            if vim.opt[k] ~= nil then
                vim.opt[k] = v
            end
        end
    end,
    __newindex = function(_, k, v)
        vim.opt[k] = v
    end
})

return utils
