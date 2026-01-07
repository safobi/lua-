return function (menu)
	local active_idx=1
	for i,v in ipairs(menu.elements) do
		if v==menu.active_element then
			active_idx=i
		end
	end
	if active_idx==1 then
		menu.active_element=menu.elements[#menu.elements]
	
	else
		menu.active_element=menu.elements[active_idx-1]

	end
end