return function (menu)
	local active_idx=1
	local no_active_idx=1
	--if menu.active_element and menu.active_element.no_active_usage then menu.active_element=menu.elements[active_idx+1] return end
	for i,v in ipairs(menu.elements) do
		if v.no_active_usage then 
			no_active_idx=i 
			--print(no_active_idx)
		end
		if v==menu.active_element then
			active_idx=i
		end
	end
	if  menu.elements[active_idx].no_active_usage then 
		--menu.active_element=menu.elements[no_active_idx+1]
		active_idx=active_idx+1
		print(active_idx)
	end

	if active_idx==#menu.elements then

		menu.active_element=menu.elements[1]
	
	else
		menu.active_element=menu.elements[active_idx+1]

	end
end