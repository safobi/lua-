local s1 = "aaabc"
local s2 = "aacaaab"
function per(sr1,sr2)
	local sl1=sr1:len()
	local sl2=sr2:len()
	local t_s={}
	res=false
	for i=1,sl1 do
		if t_s[sr1:sub(i,i)]==nil then
		t_s[sr1:sub(i,i)]=1
		else 	
			t_s[sr1:sub(i,i)]=t_s[sr1:sub(i,i)]+1
		end
	end
	local count=0
	local res_t={}
	local r,l=sl1,1
	for i=1,sl1 do
		if res_t[sr2:sub(i,i)]==nil then
		res_t[sr2:sub(i,i)]=1
		else 
			res_t[sr2:sub(i,i)]=res_t[sr2:sub(i,i)]+1
		end
		if t_s[sr2:sub(i,i)] and res_t[sr2:sub(i,i)]<=t_s[sr2:sub(i,i)] then
			count=count + 1
		elseif t_s[sr2:sub(i,i)]==nil or res_t[sr2:sub(i,i)]>t_s[sr2:sub(i,i)] then
			count=count
		end
		--print(count)
	end
	while r<=sl2 do
		r=r+1
		if res_t[sr2:sub(r,r)]==nil then
			res_t[sr2:sub(r,r)]=1
		else res_t[sr2:sub(r,r)]=res_t[sr2:sub(r,r)]+1
		end	
		if t_s[sr2:sub(r,r)] and res_t[sr2:sub(r,r)]<=t_s[sr2:sub(r,r)] then
			count=count+1
		elseif  t_s[sr2:sub(r,r)]==nil or res_t[sr2:sub(r,r)]>t_s[sr2:sub(r,r)]  then
			count=count
		end	
		res_t[sr2:sub(l,l)]=res_t[sr2:sub(l,l)]-1
		l=l+1
		if t_s[sr2:sub(l-1,l-1)] and res_t[sr2:sub(l-1,l-1)]>t_s[sr2:sub(l-1,l-1)] then		
			count=count
		elseif t_s[sr2:sub(l-1,l-1)]==nil then
		    count=count	
		 elseif t_s[sr2:sub(l-1,l-1)] and res_t[sr2:sub(l-1,l-1)]<t_s[sr2:sub(l-1,l-1)] then
		     count=count-1
		end	
		
		print(count)

		print(" left: " .. sr2:sub(l,l) .. " count: " .. res_t[sr2:sub(l,l)] .. " right : " .. sr2:sub(r,r) ..  " count : " .. res_t[sr2:sub(r,r)])

		if count==sl1 then return true end
		--print(count)
			
			

		--print(sr2:sub(l,l))

	--print(res_t[sr2:sub(r,r)])





	end
	
return res
	
end


print(per(s1,s2)) 