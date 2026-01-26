return function (menu)
	local active_idx=1
	local no_active_idx=1
	for i,v in ipairs(menu.elements) do
		if v.no_active_usage then 
				no_active_idx=i
				--print(no_active_idx)
		end
		if v==menu.active_element then
			active_idx=i
		
		end
	
	end
	
	--if menu.active_element and menu.active_element.no_active_usage then goto continue end
	if  menu.elements[no_active_idx] then 
		menu.active_element=menu.elements[no_active_idx+1]
		print(active_idx)
	elseif active_idx==#menu.elements then
	
		menu.active_element=menu.elements[1]
	
	else

		menu.active_element=menu.elements[active_idx+1]

	end
	--if menu.active_element then print(menu.active_element.name) end
	::continue::
	
	

end