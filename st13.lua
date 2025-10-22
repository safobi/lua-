local temperatures={27,30,32,35,30,37,39,40,18,2}


function temp(t)						--< не їбу за ці стаки блять просто пізда їбана 
	local res_t={temp={},
	index={} }
	local res={}
	for i, v in ipairs(t) do
		while #res_t.temp >0 and t[i]>=res_t.temp[#res_t.temp]   do
			local inx=res_t.index[#res_t.index]
			res_t.temp[#res_t.temp]=nil
			res_t.index[#res_t.index]=nil
			res[inx]=i-inx
		end
		res_t.temp[#res_t.temp+1]=v
		res_t.index[#res_t.index+1]=i
		if res[i]==nil then res[i]=0 end

	end
return res
end

local temp=temp(temperatures)

--for i,v in ipairs(temp) do print(i,v) end
local matrix={{1,2,4,8},{10,11,12,13},{14,20,30,40},{42,42,45,48}}
local target=10
--print(math.ceil(7/2))


function b_search(t,tar)				--< залупа хуйня хуйня залупа блять пізда шоб воно всралось
	local rows=#t
	local col=#t[1]
	local m_t,m_b=1,rows
	local row
	local res=false
	while m_t<=m_b do
		row=math.ceil((m_t+m_b)/2)
		if tar>t[row][#t[row]] then
			m_t=row+1
		elseif tar<t[row][1] then
			m_b=row-1
		else break
		end
	end
	if not(m_t<=m_b) then return res end

	local l,r=1,col

	while l<=r do
		local m
		m=math.floor((l+r)/2)
		if tar>t[row][m] then
			l=m+1			
		elseif tar<t[row][m] then
			r=m-1	
		else res=true 
			return res	
		end
	end
	return res
end


local ch=b_search(matrix,50)
print(ch)



