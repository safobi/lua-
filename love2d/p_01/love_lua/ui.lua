local mc=require("love_lua.mc")
local clothes=require("love_lua.clothes")
local Object=require("libs.classic")
local vars=require("love_lua.mc_vars")
local cm={}
local model_01,top_01,bot_01,full_01
local tbs={}
tbs.tabs={}
local tabs=Object:extend()
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

function tabs:new(data)
	self.name=data.name
	self.source=data.img
	self.coord={
	x=data.x, y=data.y,sx=data.sx,sy=data.sy,ox=data.ox,oy=data.oy
	}
end

local tab_cl=tabs:extend()
local tab_mains=tabs:extend()
local tab_main=tabs:extend()
function tab_cl:new(data)
	tabs.super.new(self,data)
	self.image=data.preview
	self.category=data.category
	self.isActive=false
end
function tabs_mains:new(data)
	tabs.super.new(self,data)
	self.isActive=false
	self.category=data.category
end
function tab_main:new(data)
	tabs.super.new(self,data)
	self.isDispalyed=false

end
function tabs:draw()
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
function tabs_mains:update_mains()
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
	local gap_x,gap_y=tab.gap_x,tab.gap_y
	--local x,y=area.coord.x,area.coord.y
	local t_h,t_w=area.source:getHeight()*area.coord.sy,area.source:getWidth()*area.coord.sx
	

end




function cm.load()


end

function cm.draw()


end




return cm