local nums = {1, 2, 3, 4}
function arr(t)
	local r=1
	local isDupe=false
	local res={}
	while r~=#t+1 do
		if res[t[r]]==nil then
			res[t[r]]=t[r]
			r=r+1
		else isDupe=true
			break
		end
	end
return isDupe

end

print(arr(nums))

local s,t = "jam1", "jat"

function ann(s,t)
	local count1,count2={},{}
	local isAnn=false
	local i=1
	if s:len()~=t:len() then
		isAnn=false
	else

		while i<=s:len() do
			count1[s:sub(i,i)]=(count1[s:sub(i,i)]or 0) +1
			count2[t:sub(i,i)]=(count2[t:sub(i,i)]or 0) +1
			i=i+1
		end

		for k,v in pairs(count1) do
			if v~=count2[k] then isAnn=false
			else isAnn=true
			end
		end
	end
return isAnn

end


print(ann(s,t))











