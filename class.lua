-- File  : class.lua
-- Author: Noveren
-- Desc  : Lua class 机制模拟
--[[
    local class = require("class")          -- 导入

    local A = class {                       -- 定义
        init = function(self, param)
            self.a = param.a
            self.b = param.b or 3
        end,
        get = function(self)
            return self.a + self.b
        end
    }

    local a = A{a=1}                        -- 实例
    print(a:get())                          -- 访问
--]]

local meta_class = {
    --
    __index = function(cls, idx)
        error("Class: Undefined field \"" .. idx)
    end,
    --
    __newindex = function(cls, idx, val)
        error("Class: Attempt to add \"" .. idx .. "\" field")
    end,
    --
    __call = function(cls, param)
        local self = {}
        if cls["init"] ~= nil then
            cls.init(self, param)
        end
        setmetatable(self, cls)
        return self
    end
}

return function(cls)
    cls.__index = function(self, idx)
        return getmetatable(self)[idx]
    end
    cls.__newindex = function(self, idx, val)
        error("Instance: Attempt to add \"" .. idx .. "\" field")
    end
    setmetatable(cls, meta_class) 
    return cls
end
