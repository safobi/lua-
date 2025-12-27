local mm={}
local elm=require("ui.main_menu_elements")
local util=require("ui.util_mm")
local f=require("libs.util")
local mm_v=require("ui.mm_vars")
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

end

function mm.draw()
	love.graphics.setFont(mm.font1)
	for k,v in pairs(elm) do
		util.hovered(elm[k])
		if mm_v.hovered_button==nil and elm[k].isHovered==true then
			util.draw_text_menu(elm[k],colors[2])
			mm_v.hovered_button=elm[k].name
		elseif mm_v.hovered_button~=elm[k].name and elm[k].isHovered then
			elm[mm_v.hovered_button].isHovered=false
			util.draw_text_menu(elm[k],colors[3])
			mm_v.hovered_button=elm[k].name
		elseif not elm[k].isHovered then
			util.draw_text_menu(elm[k],colors[4])
		elseif mm_v.hovered_button==elm[k].name and elm[k].isHovered then
		util.draw_text_menu(elm[k],colors[2]) 
			return
			
		end
	end



end



return mm

