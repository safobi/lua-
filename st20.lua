local Heap={}

function Heap:new(arr)
	local t={}
	setmetatable(t, self)
	self.__index=self	
	t.array=arr
	return t
end

function Heap:minHeapify(arr)
	function minHeap(arr,n,i)
		local smallest=i
		local l=2*i
		local r=2*i+1
		local t_temp
		if not self then return end	
		if r<=n and self.array[smallest]>self.array[r] then
			smallest=r
		end
		if l<=n and self.array[smallest]>self.array[l] then
			smallest=l
		end
		if smallest~=i then
			t_temp=self.array[i]
			self.array[i]=self.array[smallest]
			self.array[smallest]=t_temp
			minHeap(self.array,n,smallest)
		end
	end
	function buildMinHeap(arr,n)
		local i_start=math.floor(n/2)
		for i=i_start,1,-1 do
			minHeap(arr,n,i)
		end
	end
	buildMinHeap(self.array,#self.array)
	return self
end
function Heap:maxHeapify(arr)
	function maxHeap(arr,n,i)
		local largest=i
		local l=2*i
		local r=2*i+1
		local t_temp
		if not self then return end	
		if r<=n and self.array[largest]<self.array[r] then
			largest=r
		end
		if l<=n and self.array[largest]<self.array[l] then
			largest=l
		end
		if largest~=i then
			t_temp=self.array[i]
			self.array[i]=self.array[largest]
			self.array[largest]=t_temp
			maxHeap(self.array,n,largest)
		end
	end
	function buildMaxHeap(arr,n)
		local i_start=math.floor(n/2)
		for i=i_start,1,-1 do
			maxHeap(arr,n,i)
		end
	end
	buildMaxHeap(self.array,#self.array)
	return self
end
function Heap:deleteNodeidxMax(k)
	local node_temp
	node_temp=self.array[#self.array]
	self.array[#self.array]=self.array[k]
	self.array[k]=node_temp
	self.array[#self.array]=nil
	if k~=#self.array then
		self:maxHeapify(self.array)
	end
	return self
end
function Heap:deleteNodeidx(k)
	local node_temp
	node_temp=self.array[#self.array]
	self.array[#self.array]=self.array[k]
	self.array[k]=node_temp
	self.array[#self.array]=nil
	if k~=#self.array then
		self:minHeapify(self.array)
	end

end
function Heap:insertMax(num)
	self.array[#self.array+1]=num
	local current=#self.array
	local node_temp
	while current>1 do
		local parent=math.floor(current/2)
		if self.array[current]>self.array[parent] then
			node_temp=self.array[parent]
			self.array[parent]=self.array[current]
			self.array[current]=node_temp
			current=parent
		else break
		end
	end
	return current
end
function Heap:insertMin(num)
	self.array[#self.array+1]=num
	local current=#self.array
	local node_temp
	while current>1 do
		local parent=math.floor(current/2)
		if self.array[current]<self.array[parent] then
			node_temp=self.array[parent]
			self.array[parent]=self.array[current]
			self.array[current]=node_temp
			current=parent
		else break
		end
	end
	return current
end
function Heap:KthLargestNew(k)
	self.k=k
	local i=0
	while #self.array>k do
		self:deleteNodeidx(1)
	end
	return self
end
function Heap:KthInsert(num)
	self:insertMin(num)
	if #self.array>self.k then 
		self:deleteNodeidx(1)
	end
	return self.array[1]
end

function Heap:LastStones()
	self:maxHeapify(self.array)
	while #self.array>1 do
		local first=self.array[1]
		self:deleteNodeidxMax(1)
		local second=self.array[1]
		self:deleteNodeidxMax(1)
		if first>second then
			self:insertMax(first-second)
		end
	end
	if self.array[1]==nil then return 0 end
	return self.array[1]
end

function K_to_origin(points,k)
	local distance=Heap:new({})
	local i=1
	local z
	local res,res_t={},{}
	function destination_calc(x,y)
		local distance_c=math.sqrt(x^2+y^2)
		return distance_c
	end
	while points[i] do
		local distance_val=math.sqrt((points[i][1])^2+(points[i][2])^2)
		z=distance:insertMax(distance_val)
		table.insert(res,z,points[i])
		if #distance.array>k then
			if destination_calc(res[1][1],res[1][2])==distance.array[1] then
				table.remove(res, 1)
				distance:deleteNodeidxMax(1)
			elseif destination_calc(res[1][1],res[1][2])~=distance.array[1] then
				local j=1
				while destination_calc(res[1][1],res[1][2])~=distance.array[j] do
					j=j+1
				end
				local node_temp
				while j~=1 do
					node_temp=res[j-1]
					res[j-1]=res[j]
					res[j]=node_temp
					j=j-1
				end
				table.remove(res, 1)
				distance:deleteNodeidxMax(1)
			end			
		end		
		i=i+1
	end
return res
end



local test1=Heap:new({8,4,6,2,3,1})
local stones=Heap:new({1,2})
local points1={{0,1},{2,2},{2,0},{1,3},{1,0},{2,3}}

--stones:LastStones()
--local test2=test1:minHeapify(#test1.array)
test1:minHeapify(#test1.array)
test1:insertMin(5)
test1:deleteNodeidx(1)
test1:KthLargestNew(3)
--local t1=test1:KthInsert(7)
--print(stones:LastStones())
--test1:add(8)
--test1:add(9)
--print(test1:add(9))
for i,v in pairs((K_to_origin(points1,3))[3]) do print(i,v) end
