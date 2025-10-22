local stack={	main={},
				min={}
}

function stack:new(s)
	 s=s or {}	
	setmetatable(s, self)
	self.__index=self
	return s
end


function stack:push(...)

	for i=1, select("#", ...) do
		self.main[#self.main+1]=select(i,...)
		if self.min[1]==nil then
			self.min[1]=select(i,...)
		elseif self.main[#self.main]<=self.min[#self.min] then
			self.min[#self.min+1]=select(i,...)
	
		end
	i=i+1
	end
end

function stack.pop(self)

	if self.min[#self.min]==self.main[#self.main] then
		self.main[#self.main]=nil
		self.min[#self.min]=nil
	else
		self.main[#self.main]=nil
end


end

function stack:top()
	return self.main[#self.main]
end


function stack:getMin()
	return 	self.min[#self.min]

end


local ex=stack:new()
--print(ex.main)
ex:push(2,4,5,7)
print(ex:getMin())
ex:push(1,8)
print(ex:getMin())
ex:push(0)
print(ex:getMin())



for i,v in pairs(ex.main) do print("main: ".. v) end

for i,v in pairs(ex.min) do print("min: " .. v) end





