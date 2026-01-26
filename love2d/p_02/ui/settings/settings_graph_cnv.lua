local canv=require("ui.canvas_load")
return function()
	local mm=require("ui.main_menu")
	local menu=mm.active_menu
	menu.active_canvas={
		canvas=menu.elements[1].canvas,
		window=menu.elements[1].elements}

end