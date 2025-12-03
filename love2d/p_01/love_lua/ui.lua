local mc=require("love_lua.mc")
local clothes=require("love_lua.clothes")
local Object=require("libs.classic")
local vars=require("love_lua.mc_vars")
local cm={}
local model_01,top_01,bot_01,full_01
local tbs={}
tbs.tabs={}
local tabs_super=Object:extend()
local colors={
	{0.1, 0.5, 0.3},
	{0.2,0.6,0.9},
	{1,0.4,0},
	{0,0.5,0.3}
}

 cm.menu_img={
 	love.graphics.newImage("Images/cube800x840.png"),
 	love.graphics.newImage("Images/cube80x840.png"),
 	love.graphics.newImage("Images/cube_placeholder220x220.png"),
 	love.graphics.newImage("Images/cubde80x90.png"),
 	love.graphics.newImage("Images/mod340x980.png"),
 	love.graphics.newImage("Images/top120x162.png"),
 	love.graphics.newImage("Images/bottom161x224.png")

 }

local tab_cl=tabs_super:extend()
local tab_mains=tabs_super:extend()
local tab_main=tabs_super:extend()

function tabs_super:new(data)
	self.name=data.name
	self.source=data.img
	self.coord={
	x=data.x, y=data.y,sx=data.sx,sy=data.sy,ox=data.ox,oy=data.oy
	}
end


function tab_cl:new(data)
	tab_cl.super.new(self,data)
	self.preview=data.preview
	self.category=data.category
	self.isActive=false
end

function tab_mains:new(data)
	tab_mains.super.new(self,data)
	self.isActive=false
	self.category=data.category
end
function tab_main:new(data)
	tab_main.super.new(self,data)
	self.isDispalyed=false

end

function tabs_super:draw()
	love.graphics.draw(self.source, self.coord.x, self.coord.y, 0, self.coord.sx, self.coord.sy, self.coord.ox, self.coord.oy)
end

 function position_inside_area(position,area)
	local t_h,t_w=area.source:getHeight()*area.coord.sy,area.source:getWidth()*area.coord.sx
	local x,y=position.x, position.y
	local x1,x2=area.coord.x-(area.coord.ox*area.coord.sx or 0),area.coord.x+(area.coord.ox*area.coord.sx or 0)
	local y1,y2=area.coord.y-(area.coord.oy*area.coord.sy or 0),area.coord.y+(area.coord.oy*area.coord.sy or 0)
	return (x1<x) and (x<x2) and (y1<y) and (y<y2)
end

function update_cl(tab)
	local cat=tab.category
	local mx,my=love.mouse.getX(),love.mouse.getY()
	if position_inside_area({x=mx,y=my},tab) and love.mouse.isDown(1) then
		if cat=="top" then
			if vars.top==nil then
				vars.top=tab.name
				tab.isActive=true
				vars.full_b=false
			elseif vars.top~=tab.name then
				tbs[vars.top].isActive=false
				vars.top=tab.name
				tab.isActive=true
				vars.full_b=false
			elseif vars.top==tab.name then
				return
			end
		end
		if cat=="bot" then
			if vars.bot==nil then
				vars.bot=tab.name
				tab.isActive=true
				vars.full_b=false
			elseif vars.bot~=tab.name then
				tbs[vars.bot].isActive=false
				vars.bot=tab.name
				tab.isActive=true
				vars.full_b=false
			elseif vars.bot==tab.name then
				return
			end
		end
		if cat=="full" then
			if vars.full==nil then
				vars.full=tab.name
				tab.isActive=true
				vars.full_b=true
			elseif vars.full~=tab.name then
				tbs[vars.full].isActive=false
				vars.full=tab.name
				tab.isActive=true
				vars.full_b=true
			elseif vars.full==tab.name then
				return
			end
		end
	end
end
function tab_mains:update_mains()
	local mx,my=love.mouse.getX(),love.mouse.getY()
	if position_inside_area({x=mx,y=my},self) and love.mouse.isDown(1) then
		if vars.tab_active_clothes==nil then
			vars.tab_active_clothes=self.name
			self.isActive=true
		elseif vars.tab_active_clothes~=self.name then
			tbs[vars.tab_active_clothes].isActive=false
			vars.tab_active_clothes=self.name
			self.isActive=true
		elseif vars.tab_active_clothes==self.name then
			return
		end
	end
end

function draw_in_borders(tab,area)
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
local c=draw_in_borders({gap_x=5,gap_y=5,origin_x=480,origin_y=90,x_th=880,y_th=450},{ox=55,oy=55})

function cm.load()
	model_01=mc({img=cm.menu_img[5],x=270,y=255,sx=0.5,sy=0.5,ox=170,oy=490})
	tbs.tabs["clothes_window"]=tab_main({img=cm.menu_img[1],name="clothes_window",x=680,y=255,sx=0.5,sy=0.5,ox=400,oy=410})
	for i,v in ipairs(c) do
		tbs.tabs["clothes_top"..i]=tab_cl({img=cm.menu_img[3],name="clothes_top"..i,x=c[i][1],
		y=c[i][2],sx=0.5,sy=0.5,ox=60,oy=60,category="top",preview=cm.menu_img[6]})
	end
end

function cm.draw()
	model_01:draw_mod()
	tbs.tabs["clothes_window"]:draw()
	for i=1,#c do
		tbs.tabs["clothes_top"..i]:draw()
	end
end




return cm