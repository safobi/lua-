local Object=require("libs.classic")
local Clothes=Object:extend()

function Clothes:new(data)
	--Clothes.super.new(self)
	self.source=data.img
	self.coord={
	x=data.x, y=data.y,sx=data.sx,sy=data.sy,ox=data.ox,oy=data.oy
	}
end

function Clothes:draw_c()
	love.graphics.draw(self.source, self.coord.x, self.coord.y, 0, self.coord.sx, self.coord.sy, self.coord.ox, self.coord.oy)
end


return Clothes