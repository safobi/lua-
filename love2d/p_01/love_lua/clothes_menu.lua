
local cm={}
local tbs={}
tbs.tabs={}

 cm.menu_img={
 	love.graphics.newImage("Images/cube800x840.png"),
 	love.graphics.newImage("Images/cube80x840.png"),
 	love.graphics.newImage("Images/cube_placeholder220x220.png"),
 	love.graphics.newImage("Images/cubde80x90.png")
 }
local clothes_Ui_01=love.graphics.newImage("Images/cube800x840.png")

function tab_info(data,i)
	local if_tabs={
		name="tab_"..i,
		["isActive"]=false,
		source=data.img,
		x=data.x,y=data.y,sx=data.sx,sy=data.sy,ox=data.ox,oy=data.oy
		}
		return if_tabs
end
function position_inside_area(position,area)
	local t_h,t_w=area.source:getHeight()/area.sy,area.source:getWidth()/area.sx
	local x,y=position.x, position.y
	local x1,x2=area.x,area.x+t_w
	local y1,y2=area.y,area.y+t_h
	return (x1<x) and (x<x2) and (y1<y) and (y<y2)
end

function update_tabs(tab)
	local mx,my=love.mouse.getX(),love.mouse.getY()
	if position_inside_area({x=mx,y=my},tab) then
		if love.mouse.isDown(1) then
			tab["isActive"]=true
		end
	end
end
function tab_draw(tab_01)
	update_tabs(tab_01)
	local name_tab_Side=string.match(tab_01.name,'tab_')
	love.graphics.print(name_tab_Side)
	if tab_01[name_tab_Side] and  tab_01["isActive"] then
		love.graphics.setColor(0.1, 0.5, 0.3)
	end
	love.graphics.draw(tab_01.source, tab_01.x, tab_01.y, 0, tab_01.sx, tab_01.sy, tab_01.ox, tab_01.oy)
	
end


function cm.load()
	
	tbs.tabs["Main"]=tab_info({img=cm.menu_img[1],x=500,y=80,sx=0.5,sy=0.5},"Main")
	tbs.tabs["Side"]=tab_info({img=cm.menu_img[2],x=930,y=290,sx=0.5,sy=0.5,ox=40,oy=420},"Side")
	local dx_1,dx_2=540,100
	for i=1,4,1 do
		tbs.tabs["Main"..i]=tab_info({img=cm.menu_img[4],x=dx_1,y=100,sx=0.5,sy=0.5,ox=40,oy=45},"Main "..i)
		tbs.tabs["Side"..i]=tab_info({img=cm.menu_img[4],x=930,y=dx_2,sx=0.5,sy=0.5,ox=40,oy=45},"Side "..i)
		dx_1=dx_1+60
		dx_2=dx_2+70
	end
end


function cm.draw()
	tab_draw(tbs.tabs["Main"])
	tab_draw(tbs.tabs["Side"])
	for i=1,4,1 do 
		tab_draw(tbs.tabs["Main"..i])
		tab_draw(tbs.tabs["Side"..i])
	end
	--update_tab(tbs.tabs["Main"])
	--love.graphics.print()
end



return cm