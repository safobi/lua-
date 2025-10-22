function subsets(t)
	local res={}
	local res_t={}
	function subs(i)
		if i>#t then
			res[#res+1]={table.unpack(res_t)}
			return 
		end
		print(t[i])
		res_t[#res_t+1]=t[i]
		subs(i+1)
		table.remove(res_t)
		subs(i+1)
	end
subs(1)
return res
end

function combinedSum(t,target)
	local res={}
	function combSum(i,res_t,sum)
		if sum==target then
			res[#res+1]={table.unpack(res_t)}
			return
		end
		if i>#t or sum>target then return end
		res_t[#res_t+1]=t[i]
		combSum(i,res_t,sum+t[i])
		res_t[#res_t]=nil
		combSum(i+1,res_t,sum)	
	end
	combSum(1,{},0)
	return res
end


function combinedSum2(t,target)
	local res={}
	table.sort( t)
	function combSum2(i,res_t,sum)
		if sum==target then
			res[#res+1]={table.unpack(res_t)}
			return
		end
		if i==#t or sum>target then return end
		res_t[#res_t+1]=t[i]
		combSum2(i+1,res_t,sum+t[i])
		res_t[#res_t]=nil
		while (i+1)<#t and t[i]==t[i+1] do
			i=i+1
		end
		combSum2(i+1,res_t,sum)	
	end
	combSum2(1,{},0)
return res
end

function subsets2(t)
	local res={}
	table.sort(t)
	function subs2(i,res_t)
		if i>#t then
			res[#res+1]={table.unpack(res_t)}
			return
		end
		res_t[#res_t+1]=t[i]
		subs2(i+1,res_t)
		res_t[#res_t]=nil
		while (i+1)<=#t and t[i]==t[i+1] do
			i=i+1
		end
		subs2(i+1,res_t)
	end
		subs2(1,{})
return res
end 

function wordSearch(t,word)
	local k
	local res
	local w
	local res_t={}
	function wordS(i,j,l)	
		w=string.sub(word, l, l)
		if i<1 or j<1 or i>#t[1] or j>#t or w~=t[j][i]  or res_t[i..j] then k=false return k end
		if l==string.len(word) then k=true return k end
		res_t[i..j]=true
		res=(wordS(i+1,j,l+1) or
		wordS(i-1,j,l+1) or 
		wordS(i,j+1,l+1) or
		wordS(i,j-1,l+1))
		res_t[i..j]=false
		return res
	end
	for r=1,#t do
		for c=1,#t[1] do
			if 
			wordS(c,r,1)
			then k=true return k end
		end
	end
	return k
end

function palindromePartiotioning(s)
	local res={}
	local part={}
	local len=string.len(s)
	local k
	function ispal(s,l,r)
		local w1=string.sub(s,l,l)
		local w2=string.sub(s,r,r)
		while l<r do
			if w1~=w2 then
				return false
			end
			l=l+1
			r=r-1
		end
		return true
	end
	function palPart(i)
		if i>len then
			res[#res+1]={table.unpack(part)}
			return 
		end
		for j=i,len do
			if ispal(s,i,j)then
			part[#part+1]=string.sub(s,i,j)
			palPart(j+1)
			part[#part]=nil
			end
		end
		
	end
palPart(1)
return res
end


function digitSadge(d)
	local res={}
	local map={}
	map={ 
		["1"]="",
		["2"]="abc",
		["3"]="def",
		["4"]="ghi",
		["5"]="jkl",
		["6"]="mno",
		["7"]="pqrs",
		["8"]="tuv",
		["9"]="wxyz"
	}
	local d_s=string.sub(d,1,1)
	function digitS(i,j,curr)
		if string.len(curr)==string.len(d) then
			res[#res+1]=curr
			return
		end
		
		for char in string.gmatch(map[string.sub(d,i,i)],".") do
			digitS(i+1,j,(curr)..char)
		end
	end
	digitS(1,1,"")
return res
end


local word1="aabc"
local board={ 
{"a","b","c","d"},
{"s","a","a","t"},
{"a","c","a","e"}
}
local test3="34"
--print(digitSadge(test3))
--print(wordSearch(board,"dty"))
local test2={1,2,3}
local test1={9,2,2,4,1,5,6,9}
local tar1=9

for i,v in pairs(digitSadge(test3)) do print (i,v) end
--print(combinedSum(test1,9))