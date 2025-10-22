local s1 = "aaabc"

local s2 = "aacaaab"


function per(sr1,sr2)
	local sl1=sr1:len()
	local t_s={}
	for i=1,sl1 do
		if t_s[sr1:sub(i,i)]==nil then
		t_s[sr1:sub(i,i)]=1
		else 	
			t_s[sr1:sub(i,i)]=t_s[sr1:sub(i,i)]+1
		end
	end
	local sl2=sr2:len()
	local i1=1
	local res_t={}
	local res=false
	local i2=1
	while i1<=sl2 do
		if t_s[sr2:sub(i1,i1)] then	
			local l=i1
			local count=0
			for r=1,sl1 do
		    	res_t[sr2:sub(l,l)]=(res_t[sr2:sub(l,l)] or 0) + 1
				 if  t_s[sr2:sub(l,l)] == nil or res_t[sr2:sub(l,l)]>t_s[sr2:sub(l,l)]   then
				 	i2=l
				 	res_t={}
				 break
				 else
				 count=count+1
				 	if count==sl1 then return true end
				end
		    	l=l+1
		    end	
		i1=i2
		else i1=i1+1

		end
		print(sr2:sub(i1,i1))
print(i1)
	end
return res
end


print(per(s1,s2)) 