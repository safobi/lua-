 local nums = {1,2,2,3,3,3}
 local k1 = 2
 function fr_el(t,key)
 	local res={}
 	local r=1
 	local len={}
 	local t_sorted={}
 	for i,v in ipairs(t) do
 		
 		len[tostring(v)]=(len[tostring(v)] or 0) +1

 	end
 	
 		for k,v in pairs(len) do
 			table.insert(t_sorted,{k,v})
 		end

 		table.sort(t_sorted, function(a,b) return a[2]>b[2] end)
	
		while r<=key do
			res[r]=t_sorted[1][1]
			table.remove(t_sorted, 1)
			r=r+1
		end
	
	
 return res
	
 end

local tab
tab=fr_el(nums,k1)

for i,v in pairs(tab) do
print ("index: ".. i .. " value: " .. v) end

--fr_el(nums)




--for i,v in pairs(tab[3]) do print (i,v) end


