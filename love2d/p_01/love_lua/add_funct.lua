local f={}

function f.position_inside_area (position,area)
	local x,y=position.x, position.y
	local x1,x2=area.coord.x-(area.coord.ox*(area.coord.sx or 1)),area.coord.x+(area.coord.ox*(area.coord.sx or 1))
	local y1,y2=area.coord.y-(area.coord.oy*(area.coord.sy or 1)),area.coord.y+(area.coord.oy*(area.coord.sy or 1))
	return (x1<x) and (x<x2) and (y1<y) and (y<y2)
end


function f.draw_in_borders(tab,area)
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
		--print( "x " .. x_c.." y " .. y_c)
	end
	dfs(x_th,y_th)
	return res
end

--function for prewiew fit in clothes tab finish later???

function f.preview_count(tcl,tt)
	local tcl_im=tcl.source
	local tt_im=tt.source
	local tcl_x=tcl_im:getWidth()
	local tcl_y=tcl_im:getHeight()
	local tt_x=tt_im:getWidth()
	local tt_y=tt_im:getHeight()
	
	
end
--dumb func redo later 
function f.pr(val)
	local a
	if val then 
	 	a=val  
	else return nil end  
	return a
end
return f