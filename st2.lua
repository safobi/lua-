local nums={2,7,11,15}
local target=9
function sum(tar1,nums1)
	local res={}
	for i1,v1 in ipairs(nums1) do

		for i2,v2 in ipairs (nums1) do			 			
			if i1~=i2 then
				tar2=v1+v2
				--print(tar2)
				if tar1==tar2 then 
					res={i2,i1}
				 	
				end
				
			end	
			
		end		
	end	
	return res

end
local res = sum(9,nums)
print(res[1], res[2])




nums2={7,9,13,2,1}


rev=function (t)
	local revt={}
	for i,v in ipairs(t) do
		revt[v]=i
	end
	return revt
end
x1=rev(nums2)



function map1(tar3,tab1)

	local map={}
	local res={}
	for i,v in ipairs(tab1) do
	map[tar3-v]=i

		if map[v]~= nil then 
			res={map[v],i}
		end

	end
	
return res
end		



local res1=map1(13,nums)
print(res1[1],res1[2])












