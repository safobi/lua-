local mm={}
local elm=require("ui.main_menu_elements")
local util=require("ui.util_mm")



function mm.load()
	local x,y=love.graphics.getDimensions()
	mm.w,mm.h=x,y
	mm.font1= love.graphics.newFont(mm.h/10)

end

function mm.draw()
	love.graphics.setFont(mm.font1)
	for k,v in pairs(elm) do
		util.draw_text_menu(elm[k].text,elm[k].pos_x,elm[k].pos_y)
	end

end



return mm

