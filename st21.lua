local grid={
	{'1','1','0','1','0'},
	{'1','1','0','1','0'},
	{'0','1','0','0','0'},
	{'0','0','0','1','1'}
}

function islandsN(isl)
	local directions={{1,0},{-1,0},{0,1},{0,-1}}
	local r,c=#isl,#isl[1]
	local i_res=0
	local i_len_max=0
	local i_len=0
	local res={}
	function isl_dfs(i,j,len)
		if i<1 or j<1 or i>r or j>c or isl[i][j]=="0" then
			return
		end
		i_len=(i_len+1)
		i_len_max=math.max(i_len,i_len_max)
		isl[i][j]="0"
		for k in ipairs(directions) do
			isl_dfs(i+directions[k][1],j+directions[k][2])
		end
	end
	for i in ipairs(isl) do
		for j in ipairs(isl[i]) do
			if isl[i][j]=="1" then
				isl_dfs(i,j)
				i_res=i_res+1
				i_len=0
			end
		end
	end
	res={i_res,
		i_len_max}
	return res
end

for i,v in ipairs(islandsN(grid)) do print (i,v) end
