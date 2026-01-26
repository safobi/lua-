local canv=require("ui.canvas_load")
return function()
	local settings_graph=require("ui.settings.settings_graphics")
	local mm=require("ui.main_menu")
	local menu=mm.active_menu
	menu.active_element.expanded=true

end