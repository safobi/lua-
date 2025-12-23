local tabs_super=require("love_lua.tab_super")
local vars=require("love_lua.mc_vars")
local tab_cl=tabs_super:extend()
local f=require("love_lua.add_funct")
local tbs=require("love_lua.tabs_table")
local image=require("love_lua.image_table")

--tabs for clothes display

function tab_cl:new(data)
	tab_cl.super.new(self,data)
	self.preview=data.preview
	self.category=data.category
	self.isActive=false
end

function tab_cl:update_c1(cat,opt_c1,opt_c2)
	local mx,my=love.mouse.getX(),love.mouse.getY()
	if f.position_inside_area({x=mx,y=my},self) and love.mouse.isDown(1) then
		if vars[cat]==nil then
			shoto(opt_c1)
			shoto(opt_c2)
			vars[cat]=self.name
			self.isActive=true
		elseif vars[cat]~=self.name then
			shoto(opt_c1)
			shoto(opt_c2)
			tbs.tabs[vars[cat]].isActive=false
			vars[cat]=self.name
			self.isActive=true
		elseif vars[cat]==self.name then
			shoto(opt_c1)
			shoto(opt_c2)
			return
		end
	end

end
--not used just reference
function update_cl(tab)
	local cat=tab.category
	local mx,my=love.mouse.getX(),love.mouse.getY()
	if f.position_inside_area({x=mx,y=my},tab) and love.mouse.isDown(1) then
		if cat=="top" then
			if vars.top==nil then
				
				if tbs.tabs[vars.full] then
					tbs.tabs[vars.full].isActive=false
					vars.full=nil
				end
				vars.top=tab.name
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

function shoto(opt_cx)
	 if tbs.tabs[vars[opt_cx]] then
			tbs.tabs[vars[opt_cx]].isActive=false
			vars[opt_cx]=nil
	end
end

function tab_cl:draw(tab,tab2)
	if tab2.isDispalyed==true then
		if self.category==tab.category and vars.tab_active_clothes==tab.name then
			if self.category=="top" or self.category=="bot" then
				self:update_c1(self.category,"full")
			elseif self.category=="full" then
				self:update_c1(self.category,"top","bot")
			end

			love.graphics.draw(self.source, self.coord.x, self.coord.y, 0, self.coord.sx, self.coord.sy, self.coord.ox, self.coord.oy)

			if self.preview then
				love.graphics.draw(self.preview, self.coord.x, self.coord.y, 0, self.coord.sx, self.coord.sy, self.coord.ox, self.coord.oy)
			end

		end
	end
end




return tab_cl