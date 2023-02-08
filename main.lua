local class = require("class")

local A = class {
    init = function(self, param)
        self.a = param.a
        self.b = param.b or 3
    end,
    get = function(self)
        return self.a + self.b
    end
}

local a = A{a=1}
print(a.c)
print(a:get())
