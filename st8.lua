local strs = {"act","pots","tops","cat","stop","hat"}

function b1(s1)
        local len=string.len(s1)
        local  t1={}
        for i=1,len do
            t1[i]=string.sub(s1,i,i)        
        end
return t1
    end

function g_ann(t)
	local res={}
	local res_temp
	local key_t
	function conc(s)

        local len=string.len(s)
        local  t1={}
        for i=1,len do
            t1[i]=string.sub(s,i,i)        
        end
        table.sort(t1)
        res_temp=table.concat(t1)
        return res_temp
    end
    	 
    for i,v in ipairs(t) do

    	key_t=conc(v)

    	if res[key_t]==nil then
   			r=1
   			res[key_t]={[r]=t[i]}
   		
   		elseif res[key_t]  then
   		table.insert(res[key_t],  v)
   		
   		end  
    end
return res 	
end

local tb2=g_ann(strs)
--g_ann(strs)

for key, val in pairs(tb2) do

	for i,v in ipairs(val) do
		
		print("key: "..key.." value: " .. v)
	end
end





function iseve(s1,s2)
	if s1==s2 then return true end
end


function conc(s)
        local len=string.len(s)
        local  t1={}
        for i=1,len do
            t1[i]=string.sub(s,i,i)        
        end
        table.sort(t1)
        res_temp=table.concat(t1)
        return res_temp
    end

--print(iseve("12", "1".."2"))