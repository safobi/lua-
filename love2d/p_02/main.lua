local mm=require("ui.main_menu")


function love.load()
	mm.load_menu()
	love.window.setMode(960, 510)


end

function love.draw()
	mm.draw()
end

function love.update()
	


end

function love.keypressed(key)
	mm.key_used(key)

end