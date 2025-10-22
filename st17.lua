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

root={}

function root:new(t)
   t=t or {}
   setmetatable(t,self)
   self.__index=self
   return t
end

function root:dat(data, ...)
   if self.data==nil then self=node:new(data) end
   local n=node:new()
  --print(self.data)
   for i=2, select("#", ...) do
      print(i)
      print(n.data)
      if n.data==nil then 
         n:new(select(i,...))

      elseif n.left==nil then
          n.left:new(select(i,...))

      elseif n.right==nil then
      n.right:new(select(i,...))
   end
      if n.left~= nil and n.right~=nil then
         local t1=n.right
         n=n.left
end
i=i+1
end
   
end

node={}

function node:new(data)
   local t={}
   setmetatable(t,self)
   self.__index=self
   t.data=data
   t.left=nil
   t.right=nil
   return t
end

function node:setN(s,l)
   if s~=nil then 
    self.left=node:new(s)
 end
 if l~=nil then
    self.right=node:new(l)  
 end
end

function node:getL()
   local t={}
   function getL1(self)
      if not self then
       return end
      if self.left==nil and self.right==nil then
         t[#t+1]=self.data     
      end 
      getL1(self.left) 
      getL1(self.right)
   end
   getL1(self)
   return t
end

function node:rev()
   if not self then return end
   local t_temp=self.left
   if self.left then
   self.left=self.right
   self.right=t_temp
   end
   self.rev(self.left)
   self.rev(self.right)
   return self
end

function node:lenL()
   local len=0
   local k=0
   function lenN(self,l,r)
      if not self then
       return end
       --print("l " .. l.. " r ".. r)
       k=k+1
       len=math.max(len,k)
      lenN(self.left,l+1,r) 
      lenN(self.right,l,r+1)
       k=k-1
      end
   lenN(self,1,1)
   return len
end

function node:diam()
   local res=0  
   function dfs(self)
      if not self then return 0 end
     --if not self.data then return 0 end
      local left1=dfs(self.left)
      local  right1=dfs(self.right)
       res=math.max(res,left1+right1)
       return 1+math.max(left1,right1)
   end
   dfs(self)
   return res
end

function node:isBalanced()
   local k=true
   function isB(self)
   if not self then return 0 end
   local left=isB(self.left)
   local right=isB(self.right)
   if math.abs(left-right)>1 then k=false return k end
   return 1+math.max(left,right)
  end
  isB(self)
   return k
end

function compareThree(p,q)
  if not p and not q then 
    return true end
   if p and q and p.data==q.data then
   return
   compareThree(p.left,q.left) and
   compareThree(p.right,q.right)
else return false
     end
end

function isS(r,s)
   local sw
function isSubroot(r,s)
   if r and s and r.data~=s.data then 
      return
      isSubroot(r.left,s) or
      isSubroot(r.right,s)
   elseif r and s and r.data==s.data then
      sw=compareThree(r,s)
      return sw
   end
end
isSubroot(r,s)
return sw
end


function commonAnc(r,p,q)
   if not r or not q or not p then return end
   if math.max(p,q)<r.data then
      return commonAnc(r.left,p,q)
   elseif math.min(p,q)>r.data then
      return commonAnc(r.right,p,q)
   else
      return r.data
   end
end

function node:binaryLvl()
   local t={}
   local k=0
   function binarylvl(self)
   if not self then return end
      k=k+1
      if t[k] then
       table.insert(t[k],1, self.data) 
    else
      t[k]={self.data}
   end
      binarylvl(self.right) 
      binarylvl(self.left)
      k=k-1
   end
binarylvl(self)
return t
end

function node:binaryRightSide()
   local res={}
   function binaryRS(self,k)
      if not self then return end
      if not res[k] then
         res[k]=self.data
     end
         binaryRS(self.right,k+1) 
         binaryRS(self.left,k+1)
      end 
binaryRS(self,1)
return res
end

function node:goodNodes()
   local k=1
   function goodN(self,n_t)
      if not self then return end
      if self.data>n_t then 
         n_t=math.max(self.data,n_t)
         k=k+1
         print(n_t)
      end
      goodN(self.left,n_t)
      goodN(self.right,n_t)
   end
   goodN(self,self.data)
return k
end

function callL(self)
   if not self then return end
   callL(self.left)
   return self.data
end
function callR(self)
   if not self then return end
   callR(self.right)
   return self.data

end

function node:ValidBST()
   local k=false
   function VBST(n,left,right)
   if not n then k=true return k end
   if left>n.data or n.data>right then return false end
   return VBST(n.left,left,n.data) and VBST(n.right,n.data,right)
  end
return VBST(self,-1001,1001)
end

function node:kthSmall(k)
   local res
   function kthS(self)
      if not self then return end
      kthS(self.left)
      k=k-1
      if k==0 then 
      res=self.data
      return res end
      kthS(self.right)
   end
kthS(self)
return res
end

function rootB(preorder,inorder)
   local root
   function buildR(self)
      local mid
      root.data=preorder[1]
      for i,v in ipairs(inorder) do
         if inorder[i]==preorder[1] then
            mid=i
            break
         end
         i=i+1
      end
      

   end


end



local preO={1,2,3,4}
local inO={2,1,3,4}

local ex=node:new(5)
ex:setN(3,8)
ex.right:setN(7,9)
ex.left:setN(1,4)
ex.left.left:setN(nil,2)
local ex2=node:new(-2)
--ex2:setN(4,5)
print(ex:kthSmall(7))


--ex.right:setN(4,nil)
--ex.left.left:setN("l",8)
--local ex2=ex:rev()
--local ex1=ex:getL()
--print(ex:isBalanced())

for i,v in pairs(ex2) do print(i,v) end

 --print(ex)
--for i,v in pairs(ex) do print (i,v) end











