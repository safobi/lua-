return function (menu)
	local active_idx=1
	local no_active_idx=1
	for i,v in ipairs(menu.elements) do
		if v.no_active_usage then 
			while menu.elements[i].no_active_usage do
				i=i+1
				no_active_idx=i
			end
		end
		if v==menu.active_element then
			active_idx=i
		end
		print(active_idx)
	
	end
	--if menu.active_element and menu.active_element.no_active_usage then goto continue end
	if active_idx==no_active_idx then end
	if active_idx==#menu.elements then

		menu.active_element=menu.elements[1]
	
	else

		menu.active_element=menu.elements[active_idx+1]

	end
	--if menu.active_element then print(menu.active_element.name) end
	::continue::
	
	

end