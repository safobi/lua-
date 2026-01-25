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
	win.canvas=love.graphics.newCanvas(vars.resolution.w*0.6, vars.resolution.h*0.6)
	love.graphics.setCanvas(win.canvas)
		for i,v in ipairs(window) do
			util.draw_text_menu(window[i],colors[4])
		end
	love.graphics.setCanvas()
end
function win.draw()
	local window=win.active_window
	for i,v in ipairs(window) do
		print(v)
		util.draw_text_menu(window[i],colors[4])
	end

end

return win