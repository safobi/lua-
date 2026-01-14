local mm={}
local util=require("ui.util_mm")
local f=require("libs.util")
local colors={
	{0.1, 0.5, 0.3},
	{0.2,0.6,0.9},
	{1,0.4,0},
	{0,0.5,0.3}
}
local x,y=love.graphics.getDimensions()
	mm.w,mm.h=x,y
	mm.font1= love.graphics.newFont(mm.h/10)

function mm.load(elements,input)
	mm.elements=elements()
	mm.input_action=input()
	mm.active_menu=menu
	mm.active_element=nil

end

function mm.load_mm()
	
	mm.elements=elm()
	mm.input_action=input()
	
	 
end

function mm.key_used(key)
	local menu=mm.active_menu
	if not menu then return end
	local input_act
	if menu.active_element and  menu.active_element.input_action then
		input_act=menu.active_element.input_action[key] 
	end
	input_act= menu.input_action[key]
	if not input_act then return end
	input_act(menu)
end

function mm.load_menu(menu)

	mm.active_menu=menu 
	
	if mm.active_menu==mm then 
		mm.load_mm()
	end

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

