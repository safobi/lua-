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

function add(list1,list2)
	local mergedL=list()
	local curr=list1.first
	local curr1=list2.first
	while curr  or curr1 do
			if not curr then
				mergedL:push(curr1)
				curr1=curr1._next
				return mergedL
			elseif not curr1 then
				mergedL:push(curr)
				curr=curr._next
				return mergedL
			end
			if curr[1]<curr1[1] then
			mergedL:push(curr)
			curr=curr._next 
			else 
				mergedL:push(curr1)
				curr1=curr1._next 
			end
	end
		return mergedL
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

local arr={}
arr.mt={}
function arr.new(t)
	local Arr={}
	setmetatable(Arr, arr.mt)
	for k,l in ipairs(t) do Arr[k]=l end
		return Arr
end

table.maxn = function( tableObject )
   local maxIndex = 0
   for k, _ in pairs( tableObject ) do
      maxIndex = math.max( maxIndex, k )
   end
   return maxIndex
end


function concat(list1, list2)
    
   -- create an empty list    
   local mergedList = list()

   -- iterate first list items and push to merged List
   for v1 in list1:iterate() do
   		print(list1[1])
	
      mergedList:push(v1) 
   end
   -- iterate second list items and push to merged List
   for v in list2:iterate() do 
   print(list2[1])   
      mergedList:push(v) 
   end
   -- return the merged list
   return mergedList
end

function arr.union(a,b)
	local res={}
	local n
	return res
end
arr.mt.__add=arr.union
local l1=list({1},{2},{4},{6})
local l2=list({1},{3},{5})
local arr2=arr.new(l1:toArray())
local arr3=arr.new(l2:toArray())
local arr4=add(l1,l2)
local arr1=l1:toArray()

for i,v in pairs(arr4) do print (i,v) end


for v in arr4:iterate() do
	print (v[1]) end
--l:push({4})

