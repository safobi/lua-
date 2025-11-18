

local cm=require("love_lua.clothes_menu")


	function love.load()
		love.window.setMode(960, 510)
		cm.load()
	end

	function love.draw()
		cm.draw()
	end

function love.keypressed(key)
	if key=="escape" then
		love.event.quit()
	end

end


