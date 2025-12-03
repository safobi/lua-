function draw_inborders(tab,area)
	local res={}
	local x_ox,y_oy=area.ox,area.oy
	local gap_x,gap_y=tab.gap_x,tab.gap_y
	local x_or,y_or=tab.origin_x,tab.origin_y
	local x_th,y_th=tab.x_th,tab.y_th
	local x_c,y_c=0,0
	local check_x,check_y=0,0
	local y_lol=false
	function dfs(x,y)
		if ((x-gap_x-(2*x_ox))<x_or) or ((y-gap_y-(2*y_oy))<y_or) then return end
		if y_lol==false then
			dfs(x,y-gap_y-y_oy*2)
		end
		 y_lol=true
		dfs(x-gap_x-x_ox*2,y)
		y_lol=false
		y_c=y-gap_y-y_oy
		x_c=x-gap_x-x_ox
		res[#res+1]={x_c,y_c}
		print( "x " .. x_c.." y " .. y_c)
	end
	dfs(x_th,y_th)
	return res
end
function draw_in_borders_1(tab,area)
	local res={}
	local x_ox,y_oy=area.ox,area.oy
	local gap_x,gap_y=tab.gap_x,tab.gap_y
	local x_or,y_or=tab.origin_x,tab.origin_y
	local x_th,y_th=tab.x_th,tab.y_th
	local x_c,y_c=0,0
	local y_lol=false
	function dfs(x,y)
		if ((x+gap_x+(2*x_ox))>x_th) or ((y+gap_y+(2*y_oy))>y_th) then return end
		--if ((y+gap_y+(2*y_oy))>y_th)  then return end
		if y_lol==false then
			dfs(x,gap_y+y_oy*2+y)
		end
		y_lol=true
		y_c=gap_y+y_oy+y
		x_c=gap_x+x_ox+x
		res[#res+1]={x_c,y_c}
		-- print( "x " .. x_c.." y " .. y_c)
		 -- print( "x " .. x.." y " .. y)
		dfs(gap_x+x_ox*2+x,y)
		y_lol=false
	end
	dfs(x_or,y_or,0,0)
	return res
end
local t=draw_inborders({gap_x=5,gap_y=5,origin_x=480,origin_y=90,x_th=880,y_th=460},{ox=55,oy=55})

for i,v in ipairs(t) do print(i,v) end