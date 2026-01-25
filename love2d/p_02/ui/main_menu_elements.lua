return function()
local settings_load=require("ui.settings.settings_load")
local quit=require("ui.elements.quit_mm")
local elements={

	{
		name="b_start",
		text="Start",
		pos_x=0.2,
		pos_y=0.3,
		isHovered=false
		
	},

	{

		name="b_settings",
		text="Settings",
		pos_x=0.2,
		pos_y=0.55,
		isHovered=false,
		active_canvas=nil,
		input_action=
		{["return"]=settings_load}
	},

	{
		name="b_exit",
		text="Exit",
		pos_x=0.2,
		pos_y=0.8,
		isHovered=false,
		input_action=
		{["return"]=quit}

	}

}
	return elements
end