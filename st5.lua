local s = "abcabcbb"

function b1(s1)
        local len=string.len(s1)
        local  t1={}
        for i=1,len do
            t1[i]=string.sub(s1,i,i)        
        end
return t1
    end
local t1=b1(s)
for i,v in ipairs(t1) do print (i,v) end

function b2(t)
	local r=1
	local j=0
	local count_max=0
	local t_temp={}
	while r~=#t+1 do
		local count=0
		if t_temp[t[r]]==nil then
			t_temp[t[r]]=t[r]
			count=r-j
			--print(count)
			count_max=math.max(count_max,count)
			print(count_max)
			r=r+1
		else 
			while t_temp[t[r]] do
				j=j+1
				t_temp[t[j]]= nil
		end	
		end			
	end
	print(count_max)
	return count_max
end
print(b2(t1))