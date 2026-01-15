local f=require("libs.util")
local elm_mm=require("ui.main_menu_elements")
local input_mm=require("ui.input_data")
local elm_set=require("ui.settings.settings_mm")

return function(name)

local menus={

	["main_menu"]={
		elements=elm_mm(),
		input_action=input_mm()},
	["settings"]={
		elements=elm_set()}

}

	return menus[name]
end

