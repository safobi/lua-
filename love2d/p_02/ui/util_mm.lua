local f=require("libs.util")
local prev_elm=require("ui.elements.mm_prev_element")
local util={}

function util.position_inside_area(position,button)
	local x,y=position.x, position.y
	local win_x,win_y=love.graphics.getDimensions()
	local font=love.graphics.getFont()
	local textWidth  = font:getWidth(button.text)
	local textHeight = font:getHeight()
	local x1,x2=button.pos_x*win_x-((textWidth/2)),button.pos_x*win_x+((textWidth/2))
	local y1,y2=button.pos_y*win_y-(textHeight/2),button.pos_y*win_y+(textHeight/2)
	return (x1<x) and (x<x2) and (y1<y) and (y<y2)
end



function util.drawCenteredText(rectX, rectY, rectWidth, rectHeight, text)
	local font       = love.graphics.getFont()
	local textWidth  = font:getWidth(text)
	local textHeight = font:getHeight()
	love.graphics.print(text, rectX+rectWidth/2, rectY+rectHeight/2, 0, 1, 1, textWidth/2, textHeight/2)
end

function util.hovered(menu,button)
	local mx,my=love.mouse.getX(),love.mouse.getY()
	if util.position_inside_area({x=mx,y=my},button) then
		--button.isHovered=true
		menu.active_element=button
	elseif not util.position_inside_area({x=mx,y=my},button) then
		    --button.isHovered=false
	end
end


function util.draw_text_menu(button,color)
	local win_x,win_y=love.graphics.getDimensions()
	local font=love.graphics.getFont()
	local textWidth  = font:getWidth(button.text)
	local textHeight = font:getHeight()
	love.graphics.print({color,button.text}, button.pos_x*win_x, button.pos_y*win_y, 0, 1, 1, textWidth/2, textHeight/2)
end

return util