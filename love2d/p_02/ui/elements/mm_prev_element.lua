return function (elm,menu)
	local active_idx=1
	for i,v in ipairs(elm) do
		if v==menu.active_menu then
			active_idx=i
		end
		if active_idx==1 then
			menu.active_menu=elm[#elm]
		else
			menu.active_menu=elm[active_idx-1]
		end
		--print(menu.active_menu.name)
	end
end