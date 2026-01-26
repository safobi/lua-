local canv=require("ui.canvas_load")
return function(state)
	local mm=require("ui.main_menu")
	local menu=mm.active_menu
	menu.active_element.expanded=true
	menu.active_element.stays_active=true

end