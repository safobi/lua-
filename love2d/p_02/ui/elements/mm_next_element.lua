return function (menu)
	local active_idx=1
	local no_active_idx=1
	--if menu.active_element and menu.active_element.no_active_usage then menu.active_element=menu.elements[active_idx+1] return end
	for i,v in ipairs(menu.elements) do
		if menu.active_element and  v.no_active_usage then
			goto continue
		end
		
		if v==menu.active_element then
			active_idx=i
		end
	end
 	::continue::
		i=i+1

	if active_idx==#menu.elements then

		menu.active_element=menu.elements[1]
	
	else
		menu.active_element=menu.elements[active_idx+1]

	end
end