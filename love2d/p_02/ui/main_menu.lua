local mm={}
local elm=require("ui.main_menu_elements")
local util=require("ui.util_mm")
local f=require("libs.util")
local input=require("ui.input_data")
local prev_elm=require("ui.elements.mm_prev_element")
local colors={
	{0.1, 0.5, 0.3},
	{0.2,0.6,0.9},
	{1,0.4,0},
	{0,0.5,0.3}
}
mm.active_menu=nil

function mm.load()
	local x,y=love.graphics.getDimensions()
	mm.w,mm.h=x,y
	mm.font1= love.graphics.newFont(mm.h/10)
	mm.active_menu=mm.active_menu or elm[1]
	mm.input_action=input

end

function mm.key_used(key)
	if input[key] then
		
	end
	

end
function mm.draw()
	love.graphics.setFont(mm.font1)
	for k,v in ipairs(elm) do
		--util.isKey_used(elm,mm)
		util.hovered(elm[k])
		if  elm[k].isHovered then
			util.draw_text_menu(elm[k],colors[1])
		else
		    util.draw_text_menu(elm[k],colors[3])
		end		
	end
end



return mm

