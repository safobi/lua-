local tabs_super=require("love_lua.tab_super")
local vars=require("love_lua.mc_vars")
local tab_mains=tabs_super:extend()
local tbs=require(("love_lua.tabs_table"))
local f=require("love_lua.add_funct")
--tab for clothes switching

function tab_mains:new(data)
	tab_mains.super.new(self,data)
	self.isActive=false
	self.category=data.category
end

function tab_mains:update_mains()
	local mx,my=love.mouse.getX(),love.mouse.getY()
	if f.position_inside_area({x=mx,y=my},self) and love.mouse.isDown(1) then
		if vars.tab_active_clothes==nil then
			vars.tab_active_clothes=self.name
			self.isActive=true
		elseif vars.tab_active_clothes~=self.name then
			tbs.tabs[vars.tab_active_clothes].isActive=false
			vars.tab_active_clothes=self.name
			self.isActive=true
		elseif vars.tab_active_clothes==self.name then
			return
		end
	end
end

function tab_mains:draw(tab)
	if tab.isDispalyed then 
		self:update_mains()
		love.graphics.draw(self.source, self.coord.x, self.coord.y, 0, self.coord.sx, self.coord.sy, self.coord.ox, self.coord.oy)
	end
end



return tab_mains