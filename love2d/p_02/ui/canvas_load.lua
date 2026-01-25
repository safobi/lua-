local util=require("ui.util_mm")
return function(canvas,window,color)
		canvas:renderTo(function()
			for i,v in ipairs(window) do
				util.draw_text_menu(window[i],color)
			end

		end
		)

		return canvas

end