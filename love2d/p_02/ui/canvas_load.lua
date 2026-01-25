local util=require("ui.util_mm")
return function(window,color)


	local canvas=love.graphics.newCanvas()
		canvas:renderTo(function()
			for i,v in ipairs(window) do
				util.draw_text_menu(window[i],colors[2])
			end

		end
		)

		return canvas

end