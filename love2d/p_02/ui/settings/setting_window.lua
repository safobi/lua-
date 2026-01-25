local win={}
local util=require("ui.util_mm")
local vars=require("ui.mm_vars")
local colors={
	{0.1, 0.5, 0.3},
	{0.2,0.6,0.9},
	{1,0.4,0},
	{0,0.5,0.3}
}


function win.load(window)
	win.canvas=love.graphics.newCanvas()
	win.canvas:renderTo(function()
		for i,v in ipairs(window) do
			util.draw_text_menu(window[i],colors[4])
		end

	end
		)
end

function win.draw_C()
		love.graphics.draw(win.canvas,0,0)
end

function win.draw_canvas(window)

	win.load(window)
	win.draw_C()

end

return win