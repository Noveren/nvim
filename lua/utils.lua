local mod = {}

--[[
    常规配置工具
--]]
mod.set = {}
setmetatable(mod.set, {
    __call = function(_, settings)
        for k, v in pairs(settings) do
            vim.opt[k] = v
        end
    end,
    __newindex = function(_, k, v)
        vim.opt[k] = v
    end
})


--[[
    按键映射工具
    maps = { map, ... }
    map  = {
        lhs      = "string",
        rhs      = "string" | function,
        *mode    = "char"   | "n",
        *noremap = boolean  | true,
        *silent  = boolean  | true,
    }
--]]
mod.keymap = function(maps)
    for _, map in ipairs(maps) do
        vim.api.nvim_set_keymap(
            map.mode or "n",
            map.lhs,
            map.rhs,
            {
                noremap = map.noremap or true,
                silent  = map.silent  or true,
            }
        )
    end
end

--[[

--]]
mod.load = function(arg)
    if type(arg) == "string" then
        require(arg)
        return
    end
    if type(arg) == "table" then
        if arg.main ~= nil then
            require(arg.main)
            if arg.with ~= nil then
                for _, v in ipairs(arg.with) do
                    require(v)
                end
            end
        end
        return
    end
end

return mod
