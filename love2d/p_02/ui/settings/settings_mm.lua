return function()
	
	local back=require("ui.elements.mm_load_mm")
	local loader=require("ui.settings.settings_res_loader")
	local settings_graph=require("ui.settings.settings_graphics")
	local window=require("ui.settings.setting_window")
	local graph_canv=require("ui.settings.settings_graph_cnv")
	local elements={

	{
		name="b_graphics",
		text="Graphics",
		pos_x=0.2,
		pos_y=0.3,
		canvas=love.graphics.newCanvas(),
		elements=settings_graph(),
		input_action=
		{["return"]=graph_canv}
	},
	{
		name="b_sound",
		text="Sound",
		pos_x=0.2,
		pos_y=0.5,
		no_active_usage=true
		
	},

	{
		name="b_apply",
		text="Apply",
		pos_x=0.7,
		pos_y=0.8,
		no_active_usage=true
		
		
	},
	{
		name="b_back",
		text="Back",
		pos_x=0.2,
		pos_y=0.8,
		input_action=
		{["return"]=back}
	},
	


}



return elements
end