local mc=require("love_lua.mc")
local clothes=require("love_lua.clothes")
local Object=require("libs.classic")
local lume=require("libs.lume")
local vars=require("love_lua.mc_vars")
local cm={}
local model_01,top_01,bot_01,full_01
local tbs=require(("love_lua.tabs_table"))
local tabs_super=require("love_lua.tab_super")
local tab_cl=require("love_lua.tab_clothes")
local f=require("love_lua.add_funct")
local colors={
	{0.1, 0.5, 0.3},
	{0.2,0.6,0.9},
	{1,0.4,0},
	{0,0.5,0.3}
}

 cm.menu_img={
 	love.graphics.newImage("Images/cube800x840.png"),
 	love.graphics.newImage("Images/cube80x840.png"),
 	love.graphics.newImage("Images/cube_placeholder220x220.png"),
 	love.graphics.newImage("Images/cubde80x90.png"),
 	love.graphics.newImage("Images/mod340x980.png"),
 	love.graphics.newImage("Images/top120x162.png"),
 	love.graphics.newImage("Images/bottom161x224.png")

 }

local tab_mains=require("love_lua.tab_mains")
local tab_main=require("love_lua.tab_main")




function update_cl(tab)
	local cat=tab.category
	local mx,my=love.mouse.getX(),love.mouse.getY()
	if f.position_inside_area({x=mx,y=my},tab) and love.mouse.isDown(1) then
		if cat=="top" then
			if vars.top==nil then
				vars.top=tab.name
				if tbs.tabs[vars.full] then
					tbs.tabs[vars.full].isActive=false
					vars.full=nil
				end
				tab.isActive=true
				vars.full_b=false
			elseif vars.top~=tab.name then
				if tbs.tabs[vars.full] then
					tbs.tabs[vars.full].isActive=false
					vars.full=nil
				end
				tbs.tabs[vars.top].isActive=false

				vars.top=tab.name
				tab.isActive=true
				vars.full_b=false
			elseif vars.top==tab.name then
				if tbs.tabs[vars.full] then
					tbs.tabs[vars.full].isActive=false
					vars.full=nil
				end
				return
			end
		end
		if cat=="bot" then
			if vars.bot==nil then
				if tbs.tabs[vars.full] then
					tbs.tabs[vars.full].isActive=false
					vars.full=nil
				end
				vars.bot=tab.name
				tab.isActive=true
				vars.full_b=false
			elseif vars.bot~=tab.name then
				if tbs.tabs[vars.full] then
					tbs.tabs[vars.full].isActive=false
					vars.full=nil
				end
				tbs.tabs[vars.bot].isActive=false
				vars.bot=tab.name
				tab.isActive=true
				vars.full_b=false
			elseif vars.bot==tab.name then
				if tbs.tabs[vars.full] then
					tbs.tabs[vars.full].isActive=false
					vars.full=nil
				end
				return
			end
		end
		if cat=="full" then
			if vars.full==nil then
				vars.full=tab.name
				if tbs.tabs[vars.bot] then
					tbs.tabs[vars.bot].isActive=false
					vars.bot=nil
				end
				if tbs.tabs[vars.top] then
					tbs.tabs[vars.top].isActive=false
					vars.top=nil
				end
				tab.isActive=true
				vars.full_b=true
			elseif vars.full~=tab.name then
				tbs.tabs[vars.full].isActive=false
				if tbs.tabs[vars.bot] then
					tbs.tabs[vars.bot].isActive=false
					vars.bot=nil
				end
				if tbs.tabs[vars.top] then
					tbs.tabs[vars.top].isActive=false
					vars.top=nil
				end
				vars.full=tab.name
				tab.isActive=true
				vars.full_b=true
			elseif vars.full==tab.name then
				if tbs.tabs[vars.bot] then
					tbs.tabs[vars.bot].isActive=false
					vars.bot=nil
				end
				if tbs.tabs[vars.top] then
					tbs.tabs[vars.top].isActive=false
					vars.top=nil
				end
				return
			end
		end
	end
	if vars.bot then
		love.graphics.print(vars.bot)
	end
	if vars.top then
		love.graphics.print(vars.top)
	end
	if vars.full then
		love.graphics.print(vars.full)
	end

end





local c=f.draw_in_borders({gap_x=15,gap_y=5,origin_x=480,origin_y=90,x_th=880,y_th=450},{ox=55,oy=55})

function cm.load()
	model_01=mc({img=cm.menu_img[5],x=270,y=255,sx=0.5,sy=0.5,ox=170,oy=490})
	tbs.tabs["clothes_window"]=tab_main({img=cm.menu_img[1],name="clothes_window",x=680,y=255,sx=0.5,sy=0.5,ox=400,oy=410})
	tbs.tabs["clothes_tab_top"]=tab_mains({img=cm.menu_img[4],name="clothes_tab_top",category="top",
	x=520,y=70,sx=0.5,sy=0.5,ox=40,oy=45})
	tbs.tabs["clothes_tab_bot"]=tab_mains({img=cm.menu_img[4],name="clothes_tab_bot",category="bot",
	x=580,y=70,sx=0.5,sy=0.5,ox=40,oy=45})
	tbs.tabs["clothes_tab_full"]=tab_mains({img=cm.menu_img[4],name="clothes_tab_full",category="full",
	x=640,y=70,sx=0.5,sy=0.5,ox=40,oy=45})
	top_01=clothes({img=cm.menu_img[6],name="top_01",category="top",x=280,y=142,sx=0.5,sy=0.5,ox=60,oy=81})
	bop_01=clothes({img=cm.menu_img[7],name="bot_01",category="bot",x=275,y=260,sx=0.5,sy=0.5,ox=80.5,oy=112})
	for i,v in ipairs(c) do
		tbs.tabs["clothes_top"..i]=tab_cl({img=cm.menu_img[3],name="clothes_top"..tostring(i),x=c[i][1],
		y=c[i][2],sx=0.5,sy=0.5,ox=110,oy=110,category="top",preview=cm.menu_img[6]})
	end
	for i,v in ipairs(c) do
		tbs.tabs["clothes_bot"..i]=tab_cl({img=cm.menu_img[3],name="clothes_bot"..i,x=c[i][1],
		y=c[i][2],sx=0.5,sy=0.5,ox=110,oy=110,category="bot",preview=cm.menu_img[7]})
	end
	tbs.tabs["clothes_full1"]=tab_cl({img=cm.menu_img[3],name="clothes_full1",x=c[1][1],
		y=c[1][2],sx=0.5,sy=0.5,ox=110,oy=110,category="full",preview=cm.menu_img[7]})
	tbs.tabs["clothes_full2"]=tab_cl({img=cm.menu_img[3],name="clothes_full1",x=c[2][1],
		y=c[2][2],sx=0.5,sy=0.5,ox=110,oy=110,category="full",preview=cm.menu_img[7]})
end


function cm.draw()
	model_01:draw_mod()
	tbs.tabs["clothes_window"]:draw()
	tbs.tabs["clothes_tab_top"]:draw()
	tbs.tabs["clothes_tab_bot"]:draw()
	tbs.tabs["clothes_tab_full"]:draw()
	for i=1,#c do
		tbs.tabs["clothes_top"..i]:draw(tbs.tabs["clothes_tab_top"])
	end
	tbs.tabs["clothes_bot1"]:draw(tbs.tabs["clothes_tab_bot"])
	tbs.tabs["clothes_full1"]:draw(tbs.tabs["clothes_tab_full"])
	tbs.tabs["clothes_full2"]:draw(tbs.tabs["clothes_tab_full"])
	tbs.tabs["clothes_bot2"]:draw(tbs.tabs["clothes_tab_bot"])
	top_01:draw_c(tbs.tabs["clothes_top1"])
	bop_01:draw_c(tbs.tabs["clothes_bot1"])

end




return cm