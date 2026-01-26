return function(menu)
    if not menu.elements or #menu.elements == 0 then return end

    local count = #menu.elements
    local active_idx = 1
    if menu.active_element and menu.active_element.no_active_usage then
   		 menu.active_element = nil
	end

    -- find current active index
    for i, v in ipairs(menu.elements) do
        if v == menu.active_element then
            active_idx = i
            break
        end
    end

    -- try next elements until a valid one is found
    for _ = 1, count do
        active_idx = active_idx % count + 1
        local el = menu.elements[active_idx]

        if not el.no_active_usage then
            menu.active_element = el
            return
        end
    end

    -- fallback: no valid elements found
    menu.active_element = nil
end