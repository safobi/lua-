return function()
	local vars=require("ui.mm_vars")
	local back=require("ui.elements.mm_load_mm")
	local loader=require("ui.settings.settings_res_loader")
	local elements={

	{
		name="b_resolution",
		text="Resolution",
		pos_x=0.2,
		pos_y=0.3,
		no_active_usage=true
		
	},

	{
		name="b_apply",
		text="Apply",
		pos_x=0.7,
		pos_y=0.8,
		
		
	},
	{
		name="b_back",
		text="Back",
		pos_x=0.2,
		pos_y=0.8,
		input_action=
		{["return"]=back}
	},
	{
		name="b_res_display",
		text=vars.resolution.w.."x"..vars.resolution.h,
		pos_x=0.7,
		pos_y=0.3,
		input_action=
		{["return"]=loader
	}
}


}



return elements
end