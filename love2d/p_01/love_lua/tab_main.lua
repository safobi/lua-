local tabs_super=require("love_lua.tab_super")
local vars=require("love_lua.mc_vars")
local tab_main=tabs_super:extend()

function tab_main:new(data)
	tab_main.super.new(self,data)
	self.isDispalyed=false
end





return tab_main