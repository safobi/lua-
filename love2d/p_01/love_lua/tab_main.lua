local tabs_super=require("love_lua.tab_super")
local vars=require("love_lua.mc_vars")
local tab_main=tabs_super:extend()
local f=require("love_lua.add_funct")
local tbs=require("love_lua.tabs_table")

function tab_main:new(data)
	tab_main.super.new(self,data)
	self.isDispalyed=false
	self.menu_category=data.category
end

function tab_main:update_1(tab)
	local mx,my=love.mouse.getX(),love.mouse.getY()
	if f.position_inside_area({x=mx,y=my},self) and love.mouse.isDown(1) then
		if vars.tab_active_menu==nil then
			vars.tab_active_menu=tab.name
			tab.isDispalyed=true
		elseif vars.tab_active_menu~=tab.name then
			tbs.tabs[vars.tab_active_menu].isDispalyed=false
			vars.tab_active_menu=tab.name
			tab.isDispalyed=true
		elseif vars.tab_active_menu==tab.name then
			return
		end
	end
end

function tab_main:draw_1(tab)
	self:update_1(tab)
	love.graphics.draw(self.source, self.coord.x, self.coord.y, 0, self.coord.sx, self.coord.sy, self.coord.ox, self.coord.oy)
end

function tab_main:draw_u()
	if self.isDispalyed==true then
		love.graphics.draw(self.source, self.coord.x, self.coord.y, 0, self.coord.sx, self.coord.sy, self.coord.ox, self.coord.oy)
	end

end




return tab_main