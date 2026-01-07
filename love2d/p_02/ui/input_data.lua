return function()

local prev_elm=require("ui.elements.mm_prev_element")
local next_elm=require("ui.elements.mm_next_element")
local quit=require("ui.elements.quit_mm")
local input={

w=prev_elm,
s=next_elm,
escape=quit



}

return input
end