local Object=require("libs.classic")
local mc=Object:extend()

function mc:new(data)
	self.source=data.img
	self.coord={
	x=data.x, y=data.y,sx=data.sx,sy=data.sy,ox=data.ox,oy=data.oy}
end

function mc:update_clothes(data)
	self.active_clothes={
		top=data.top,
		bottom=data.bot,
		full_body=data.full_b
	}

end
function mc:draw_mod()
	love.graphics.draw(self.source, self.coord.x, self.coord.y, 0, self.coord.sx, self.coord.sy, self.coord.ox, self.coord.oy)
end

return mc