trie={}

function trie:new()
	local t={}
	setmetatable(t, self)
	self.__index=self
	return t
end

function trie:insert(data)
	if type(data)~="string" then return end
	local len=string.len(data)
	local w_start=string.sub(data,1,1) 
	local nodeS=self[w_start]
	if nodeS==nil then 
		nodeS={isWord=false}
		self[w_start]=nodeS
	end
	
	function addnode(node,position,word)
		local char=string.sub(word,position,position)
		local child=node[char]
		if child==nil then
			child={isWord=false}
			node[char]=child
		end
		if position<len then
			addnode(child,position+1,word)
		elseif position==len then
			child.isWord=true
		end
	end
	addnode(nodeS,2,data)
	return self
end

function trie:search(word)
	local k=false
	function search(self,position)
		local char=string.sub(word,position,position)
		if  self[char] then 
			search(self[char],position+1)	
		end
		if self.isWord==true then k=true return k end
	end
	search(self,1)
return k
end

function trie:startsWith(prefix)
	local k=false
	local len=string.len(prefix)
	function startW(self,position)
		local char=string.sub(prefix,position,position)
		if  self[char] and position<len then 
			startW(self[char],position+1)	
		elseif self[char] and position==len then k=true return k
		end
	end
	startW(self,1)
	return k
end





local test1=trie:new()
test1:insert("apple")
test1:insert("ape")
test1:insert("apply")
test1:insert("bee")
test1:insert("act")
print(test1:startsWith("bes"))

for i,v in pairs (test1.a) do print(i,v) end




