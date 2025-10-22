list={}
list.__index=list
setmetatable(list, { __call = function(_, ...)
   local t = setmetatable({ length = 0 }, list)
      for _, v in ipairs{...} 
         do t:push(v) 
      end
      return t
   end })

function list:push(t)
   -- move till last node    
   if self.last then
      self.last._next = t
      t._prev = self.last
      self.last = t
   else
      -- set the node as first node
      self.first = t
      self.last = t
   end
   -- increment the length of the list
   self.length = self.length + 1
end

local function iterate(self,current)
	if not current then
		current=self.first
	elseif current then
		current=current._next
	end
	return current
end

function list:iterate()
	return iterate,self,nil
end

function list:getFirst()
   -- if first is nil then return
   if not self.first then
      return 
   end
   return self.first
end

function list:getLast()
   -- if last is nil then return
   if not self.last then
      return 
   end
   return self.last
end
-- iterate through the list
local function reverseIterate(self, current)
   -- if current is nil
   -- set the current as last node
   if not current then
      current = self.last
   -- if current is present
   -- set current as current prev   
   elseif current then
      current = current._prev
   end
   -- return current  
   return current
end

-- return the iterator
function list:reverseIterator()
   return reverseIterate, self, nil
end

function list:toArray()
   local array={}
   local current=self.first
   while current do
      array[#array+1]=current[1]
      current=current._next
   end
   return array
end

function rev(list1)
   local len=math.ceil(list1.length/2)
   local start=list1.first
   local list_r=list()
   local last1=list1.last
   local i=1
   while i<=len do
      print("i " .. i)
      print("start " .. start[1])
      print("last_prev " .. last1._prev[1])
      print("last " .. last1[1])
      list_r:push({start[1]})
      list_r:push({last1[1]}) 
      start=start._next 
      last1=last1._prev
      if start==last1 then 
          list_r:push({start[1]}) return list_r end
      i=i+1
        end
   return list_r
end

local head=list({2},{4},{5},{6},{8})
local rev1=rev(head)

for i,v in pairs(head.last) do print (i,v) end

for v in rev1:iterate() do
   print (v[1]) end









