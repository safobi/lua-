local mm={}
local elm=require("ui.main_menu_elements")
local util=require("ui.util_mm")
local f=require("libs.util")
local input=require("ui.input_data")
local colors={
	{0.1, 0.5, 0.3},
	{0.2,0.6,0.9},
	{1,0.4,0},
	{0,0.5,0.3}
}



function mm.load()
	local x,y=love.graphics.getDimensions()
	mm.w,mm.h=x,y
	mm.font1= love.graphics.newFont(mm.h/10)
	mm.elements=elm()
	mm.input_action=input()
	mm.active_element=nil
	mm.active_menu=mm.active_menu or mm
end

function mm.key_used(key)
	local menu=mm.active_menu
	if not menu then return end
	local input_act
	input_act= menu.input_action[key]
	if not input_act then return end
	input_act(menu)
end

function mm.load_menu()
	




end



function mm.draw()
	love.graphics.setFont(mm.font1)
	for k,v in ipairs(mm.elements) do
		util.hovered(mm,mm.elements[k])
		if   v==mm.active_element then
			util.draw_text_menu(mm.elements[k],colors[1])
		else
		    util.draw_text_menu(mm.elements[k],colors[3])
		end		
	end
end



return mm

