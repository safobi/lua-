local str={"we#","say",":","yes"}

function encode(t)
	local res=""			--< empty string to start concatanation
	for i,v in ipairs(t) do
		local sep=string.len(t[i])		--< lenght of string for using it later
		res=res.."~"..sep.."#"..t[i]	--<	using two separators in case of numbers in string 
	end
	return res
end

function decode(s)
	local res={}
	local sep2											--< outside of loop, needs to be tracked through whole loop
	local i=1 											--< index for results
	for sep in string.gmatch(s, "%~%d+%#" ) do 			--<	gmatch for finding pattern encoded earlier, gl with writing pattern :)
														-- in this case, "sep" is pattern: ~"lenght of string in array" #
		local st=tonumber(sep:sub(2,sep:len()-1))		--< this is lenght of string in array, we separating number from "~" and "#"
														--	start form "2" position bc "1" is "~", last position is "#"; converting 
														-- string to number 
		sep2=st+sep:len()+(sep2 or 0)					--< this is last index in complex:"separator-string", we track it through all 
														-- loop to know next string last index
		res[i]=s:sub(sep2-st+1,sep2)					--<	sunstring index: first is last index-lenght of string +1
		i=i+1
	end
	return res
end

local dec=decode(encode(str))
for i,v in ipairs(dec) do print (i,v ) end


print(encode(str))