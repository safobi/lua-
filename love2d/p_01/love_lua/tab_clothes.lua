local tabs_super=require("love_lua.tab_super")
local vars=require("love_lua.mc_vars")
local tab_cl=tabs_super:extend()
local f=require("love_lua.add_funct")


function tab_cl:new(data)
	tab_cl.super.new(self,data)
	self.preview=data.preview
	self.category=data.category
	self.isActive=false
end

function update_c1(tab)
	local cat=tab.category
	local mx,my=love.mouse.getX(),love.mouse.getY()

end
function update_cl(tab)
	local cat=tab.category
	local mx,my=love.mouse.getX(),love.mouse.getY()
	if f.position_inside_area({x=mx,y=my},tab) and love.mouse.isDown(1) then
		if cat=="top" then
			if vars.top==nil then
				vars.top=tab.name
				if tbs.tabs[vars.full] then
					tbs.tabs[vars.full].isActive=false
					vars.full=nil
				end
				tab.isActive=true
				vars.full_b=false
			elseif vars.top~=tab.name then
				if tbs.tabs[vars.full] then
					tbs.tabs[vars.full].isActive=false
					vars.full=nil
				end
				tbs.tabs[vars.top].isActive=false

				vars.top=tab.name
				tab.isActive=true
				vars.full_b=false
			elseif vars.top==tab.name then
				if tbs.tabs[vars.full] then
					tbs.tabs[vars.full].isActive=false
					vars.full=nil
				end
				return
			end
		end
		if cat=="bot" then
			if vars.bot==nil then
				if tbs.tabs[vars.full] then
					tbs.tabs[vars.full].isActive=false
					vars.full=nil
				end
				vars.bot=tab.name
				tab.isActive=true
				vars.full_b=false
			elseif vars.bot~=tab.name then
				if tbs.tabs[vars.full] then
					tbs.tabs[vars.full].isActive=false
					vars.full=nil
				end
				tbs.tabs[vars.bot].isActive=false
				vars.bot=tab.name
				tab.isActive=true
				vars.full_b=false
			elseif vars.bot==tab.name then
				if tbs.tabs[vars.full] then
					tbs.tabs[vars.full].isActive=false
					vars.full=nil
				end
				return
			end
		end
		if cat=="full" then
			if vars.full==nil then
				vars.full=tab.name
				if tbs.tabs[vars.bot] then
					tbs.tabs[vars.bot].isActive=false
					vars.bot=nil
				end
				if tbs.tabs[vars.top] then
					tbs.tabs[vars.top].isActive=false
					vars.top=nil
				end
				tab.isActive=true
				vars.full_b=true
			elseif vars.full~=tab.name then
				tbs.tabs[vars.full].isActive=false
				if tbs.tabs[vars.bot] then
					tbs.tabs[vars.bot].isActive=false
					vars.bot=nil
				end
				if tbs.tabs[vars.top] then
					tbs.tabs[vars.top].isActive=false
					vars.top=nil
				end
				vars.full=tab.name
				tab.isActive=true
				vars.full_b=true
			elseif vars.full==tab.name then
				if tbs.tabs[vars.bot] then
					tbs.tabs[vars.bot].isActive=false
					vars.bot=nil
				end
				if tbs.tabs[vars.top] then
					tbs.tabs[vars.top].isActive=false
					vars.top=nil
				end
				return
			end
		end
	end
	if vars.bot then
		love.graphics.print(vars.bot)
	end
	if vars.top then
		love.graphics.print(vars.top)
	end
	if vars.full then
		love.graphics.print(vars.full)
	end

end

function tab_cl:draw(tab)
	if self.category==tab.category and vars.tab_active_clothes==tab.name then
		update_cl(self)
		love.graphics.draw(self.source, self.coord.x, self.coord.y, 0, self.coord.sx, self.coord.sy, self.coord.ox, self.coord.oy)
	end
end




return tab_cl