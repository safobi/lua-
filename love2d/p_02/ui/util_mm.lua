local util={}

function util.drawCenteredText(rectX, rectY, rectWidth, rectHeight, text)
	local font       = love.graphics.getFont()
	local textWidth  = font:getWidth(text)
	local textHeight = font:getHeight()
	love.graphics.print(text, rectX+rectWidth/2, rectY+rectHeight/2, 0, 1, 1, textWidth/2, textHeight/2)
end

function util.set_pos()
	
end


function util.draw_text_menu(text,x,y)
	local win_x,win_y=love.graphics.getDimensions()
	local font=love.graphics.getFont()
	local textWidth  = font:getWidth(text)
	local textHeight = font:getHeight()
	love.graphics.print(text, x*win_x, y*win_y, 0, 1, 1, textWidth/2, textHeight/2)
end

return util