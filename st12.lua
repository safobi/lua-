local tokens={"3","2","/","6","-","4","*"}
function rpn(t)
	local res
	local res_t={}
	for i,v in ipairs(t) do
		local op={["+"]=true,["*"]=true,["-"]=true,["/"]=true}

		if not op[t[i]] then
			res_t[#res_t+1]=v
		elseif t[i]=="+" then 
			res_t[1]=res_t[1]+res_t[2]
			res_t[2]=nil

		elseif t[i]=="-" then 
			res_t[1]=res_t[1]-res_t[2]
			res_t[2]=nil

		elseif t[i]=="*" then 
			res_t[1]=res_t[1]*res_t[2]
			res_t[2]=nil
				
		elseif t[i]=="/" then 
			res_t[1]=res_t[1]/res_t[2]
			res_t[2]=nil

		end
	end
	res=res_t[#res_t]
	return(res)
end

--print(rpn(tokens))

local n=2
function gen_p(k)						--< this is a mess idk wtf is happening there if in need of cool recursion
										-- pls try to imitate its cool and incomprehesible \0/
	local res={}
	local res_t
	function backtrack(open,closed)
		print(open,closed)
		if open==closed and open==k then
			res[#res+1]=res_t	
			print("res : " .. res_t)

		else
		--print(res_t)
		if open<k then
			res_t=(res_t or "").. "("
			print("open before: " .. res_t .. " " .. open)
			backtrack(open+1,closed)
			res_t=string.sub(res_t,1,res_t:len()-1)
				print("inside open: " .. res_t .." " ..open)
			
		end

		if closed<open then
			res_t=res_t .. ")"
			print("closed before: " .. res_t .. " " .. closed)
			backtrack(open,closed+1)
			res_t=string.sub(res_t,1,res_t:len()-1)
			print("inside closed: " .. res_t .. " :" .. closed)

		end
	end
		
	end
	backtrack(0,0)
	return res

end

local res1=gen_p(n)

for i,v in ipairs(res1) do print (v) end

