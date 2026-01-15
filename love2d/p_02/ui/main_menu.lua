local mm={}
local util=require("ui.util_mm")
local f=require("libs.util")
local menus=require("ui.menus")
local colors={
	{0.1, 0.5, 0.3},
	{0.2,0.6,0.9},
	{1,0.4,0},
	{0,0.5,0.3}
}

local x,y=love.graphics.getDimensions()
	mm.w,mm.h=x,y
	mm.font1= love.graphics.newFont(mm.h/10)
	mm.active_menu=nil

function mm.load(menu_name)
	local menu=menus(menu_name)
	mm.active_menu=menu
	mm.active_element=nil

end


function mm.key_used(key)
	local menu=mm.active_menu
	if not menu then return end
	local input_act
	if menu.active_element and  menu.active_element.input_action then
		input_act=menu.active_element.input_action[key] 
	end
	input_act=input_act or menu.input_action[key]
	if not input_act then return end
	input_act(menu)
end

function mm.mouse_used()
	local menu=mm.active_menu
	if not menu then return end
	if not menu.active_element.input_action then return end
	local mouse_act=love.mouse.isDown(1)
	if menu.active_element and mouse_act then
		menu.active_element.input_action["return"]()
	end
end


function mm.draw()
	local menu=mm.active_menu
	love.graphics.setFont(mm.font1)
	for k,v in ipairs(menu.elements) do
		util.hovered(menu,menu.elements[k])
		if   v==menu.active_element then
			if menu.active_element.is_colored then return end
			util.draw_text_menu(menu.elements[k],colors[1])
		else
		    util.draw_text_menu(menu.elements[k],colors[3])
		end		
	end
end



return mm

