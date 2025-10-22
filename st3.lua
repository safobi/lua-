local l1={2,4,3,7}
local l2={5,6,4}

function ripairs(t)
	local max=1
	while t[max]~= nil do
		max=max+1
		end
	local function ripairs_it(t,i)
		i=i-1
		local v=t[i]
			if v~=nil then
				return i,v
			else 
				return nil
			end
	end
	return ripairs_it,t,max
end



sum2=function(t1,t2)
--making reverse table
	function tbl1(t)
		local l4={}
		local max=1
		while t[max]~=nil do 
			max=max+1
		end
		for i,v in ipairs(t) do
			l4[max-i]=v
		end
	
	return l4
	end
--converting table to string
	function num(t)
		local str={}
		for i,v in ipairs (t) do
			if type(v)=="number" then v=tostring(v) end
			str[i]=v
		end
		return str
	end
--  concat table  and convert sum back to number
	function conv()
		local res={}
		local sum3=tonumber(table.concat(num(tbl1(t1))))+tonumber(table.concat(num(tbl1(t2))))
		local ss=tonumber(table.concat(num(tbl1(t1))))
		print(ss)
		local sum4=tostring(sum3)
		for i=1,#sum4 do  table.insert(res, tonumber(sum4:sub(i,i))) end
		return res

	end
	--revers result
	local st1=tbl1(conv())
	return st1
	

end
local x3=sum2(l1,l2)
for i,v in ipairs(x3) do print(i,v) end

print(type(x3[1]))

sum2(l2,l1)

function rev(t)
	local k=#t+1
	local tb={}
	for i,v in ipairs(t) do
		tb[k-i]=v	
	end
return tb
end

local y1=rev(l1)

print (y1[4])