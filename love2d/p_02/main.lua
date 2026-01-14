local mm=require("ui.main_menu")
local elm=require("ui.main_menu_elements")
local input=require("ui.input_data")
function love.load()
	mm.load(elm,input)
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