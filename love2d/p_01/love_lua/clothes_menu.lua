local lume=require("libs.lume")
local store=require("love_lua.mc_vars")
local mc=require("love_lua.mc")
local clothes=require("love_lua.clothes")
local cm={}
local model_01,top_01,bot_01,full_01
local tbs={}
tbs.tabs={}
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
function tab_info(data,i)
	local if_tabs={
		name=i,
		["isActive"]=false,
		source=data.img,
		x=data.x,y=data.y,sx=data.sx,sy=data.sy,ox=data.ox,oy=data.oy
		}
		return if_tabs
end
function position_inside_area(position,area)
	local t_h,t_w=area.source:getHeight()*area.sy,area.source:getWidth()*area.sx
	local x,y=position.x, position.y
	local x1,x2=area.x-(area.ox*area.sx or 0),area.x+(area.ox*area.sx or 0)
	local y1,y2=area.y-(area.oy*area.sy or 0),area.y+(area.oy*area.sy or 0)
	return (x1<x) and (x<x2) and (y1<y) and (y<y2)
end
function update_tab_clothes(tab,tab_t)
	local mx,my=love.mouse.getX(),love.mouse.getY()
	if position_inside_area({x=mx,y=my},tab) and love.mouse.isDown(1) then


	end

end

function update_tabs(tab,t_tar)
	local mx,my=love.mouse.getX(),love.mouse.getY()
	if position_inside_area({x=mx,y=my},tab) and love.mouse.isDown(1) then
		if t_tar.active==nil then
			t_tar.active=tab.name			
			tab.isActive=true
		elseif t_tar.active~=tab.name then
			t_tar.tabs[t_tar.active].isActive=false
			t_tar.active=tab.name
			tab["isActive"]=true
		elseif t_tar.active==tab.name then
			return
		end
	end
end

function main_draw(tab_01,tab_02)
	love.graphics.draw(tab_01.source, tab_01.x, tab_01.y, 0, tab_01.sx, tab_01.sy, tab_01.ox, tab_01.oy)
	if tab_02 then
		love.graphics.draw(tab_02.source, tab_02.x, tab_01.y, 0, tab_02.sx, tab_02.sy, tab_02.ox, tab_02.oy)
	end

end
function tab_M_draw(tab_01,...)
	local arg={...}
	love.graphics.draw(tab_01.source, tab_01.x, tab_01.y, 0, tab_01.sx, tab_01.sy, tab_01.ox, tab_01.oy)
	for i=1,#arg,1 do
		love.graphics.draw(arg[i].source, arg[i].x, arg[i].y, 0, arg[i].sx, arg[i].sy, arg[i].ox, arg[i].oy)
		--tab_M_draw(arg[i])
		update_tabs(arg[i],tab_01)
	end
end
function tab_c(tab_01,tab_02,t_arg)
	update_tabs(tab_01,tab_02)
	if tab_01.isActive then

		tab_M_draw(tab_01)

	end



end

function tab_draw(tab_01)
	local k=update_tabs(tab_01,tbs)
	local name_tab_Side=string.match(tab_01.name,'(Side_%d)$')
	local name_tab_Main=string.match(tab_01.name,'(Main_%d)$')
	--love.graphics.print(name_tab_Side)
	if  tab_01["isActive"]==true then
		--love.graphics.print(name_tab_Side)
		if name_tab_Side=="Side_1" then
			love.graphics.setColor(colors[1])
			tab_M_draw(tbs.tabs["Main"],tbs.tabs["Main"].tabs["Main_1"],tbs.tabs["Main"].tabs["Main_2"],
				tbs.tabs["Main"].tabs["Main_3"],tbs.tabs["Main"].tabs["Main_4"])
			tab_M_draw(tbs.tabs["Main"].tabs["Main_1"],tbs.tabs["Main"].tabs["Main_1"]["Main_t1"])
		elseif name_tab_Side=="Side_2" then
			love.graphics.setColor(colors[2])
		elseif name_tab_Side=="Side_3" then
			love.graphics.setColor(colors[3])
		elseif name_tab_Side=="Side_4" then
			love.graphics.setColor(colors[4])
		end	
	
end
	love.graphics.draw(tab_01.source, tab_01.x, tab_01.y, 0, tab_01.sx, tab_01.sy, tab_01.ox, tab_01.oy)
end


function cm.load()

	model_01=mc({img=cm.menu_img[5],x=270,y=255,sx=0.5,sy=0.5,ox=170,oy=490})
	top_01=clothes({img=cm.menu_img[6],x=280,y=142,sx=0.5,sy=0.5,ox=60,oy=81})
	bot_01=clothes({img=cm.menu_img[7],x=275,y=260,sx=0.5,sy=0.5,ox=80.5,oy=112})
	tbs.tabs["Main"]=tab_info({img=cm.menu_img[1],x=500,y=80,sx=0.5,sy=0.5,ox=0,oy=0},"Main")
	tbs.tabs["Main"].tabs={}
	tbs.tabs["Main"].tabs["Main_1"]={}
	tbs.tabs["Side"]=tab_info({img=cm.menu_img[2],x=930,y=290,sx=0.5,sy=0.5,ox=40,oy=420},"Side")
	local dx_1,dx_2,dx_3=540,100,575
	for i=1,4,1 do
		tbs.tabs["Main"].tabs["Main_"..i]=tab_info({img=cm.menu_img[4],x=dx_1,y=100,sx=0.5,sy=0.5,ox=40,oy=45},"Main_"..i)
		tbs.tabs["Side_"..i]=tab_info({img=cm.menu_img[4],x=930,y=dx_2,sx=0.5,sy=0.5,ox=40,oy=45},"Side_"..i)
		tbs.tabs["Main"].tabs["Main_1"]["Main_t"..i]=tab_info({img=cm.menu_img[3],x=dx_3,y=185,sx=0.5,sy=0.5,ox=110,oy=110},"Main_t"..i)
		dx_1=dx_1+60
		dx_2=dx_2+70
	end
end


function cm.draw()
	--tab_draw(tbs.tabs["Main"])
	main_draw(tbs.tabs["Side"])
	--tab_draw(tbs.tabs["Main_t1"])
	for i=1,4,1 do 
		--tab_draw(tbs.tabs["Main_"..i])
		tab_draw(tbs.tabs["Side_"..i])
	end
	model_01:draw_mod()
	top_01:draw_c()
	bot_01:draw_c()
	--update_tab(tbs.tabs["Main"])
	--love.graphics.print()
end



return cm