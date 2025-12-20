local Object=require("libs.classic")
local tabs_super=Object:extend()
local f=require("love_lua.add_funct")



function tabs_super:new(data)
	self.name=data.name
	self.source=data.img
	self.coord={
	x=data.x, y=data.y,sx=data.sx,sy=data.sy,ox=data.ox,oy=data.oy
	}
end

function tabs_super:draw()
	love.graphics.draw(self.source, self.coord.x, self.coord.y, 0, self.coord.sx, self.coord.sy, self.coord.ox, self.coord.oy)
end
 
return tabs_super


