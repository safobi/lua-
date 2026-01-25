local util=require("ui.util_mm")
local vars=require("ui.mm_vars")
return function()

local set={

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
return set
end