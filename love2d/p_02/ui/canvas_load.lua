local util=require("ui.util_mm")
return function(canvas,func)
		canvas:renderTo(function()
			func()
		end
		)
		love.graphics.draw(canvas,0,0)
end