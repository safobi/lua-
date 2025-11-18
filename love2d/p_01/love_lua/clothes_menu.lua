
local cm={}


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


function tab_draw(tab_01)
	if tab_01["isActive"] then
		love.graphics.setColor(0.1, 0.5, 0.3)
	end
	love.graphics.draw(tab_01.source, tab_01.x, tab_01.y, 0, tab_01.sx, tab_01.sy, tab_01.ox, tab_01.oy)
	
end

function cm.load()
	tbs={}
	local tbs_c={
		{x0=500,y0=80},
		{x0=930,y0=290}

	}
	tbs.tabs={}
	tbs.tabs["Main"]=tab_info({img=cm.menu_img[1],x=500,y=80,sx=0.5,sy=0.5},"Main")
	tbs.tabs["Side"]=tab_info({img=cm.menu_img[2],x=930,y=290,sx=0.5,sy=0.5,ox=40,oy=420},"Side")
	for i=1,4,1 do
		tbs.tabs["Main"..i]=tab_info({img=cm.menu_img[4],x=500,y=80,sx=0.5,sy=0.5,ox=40,oy=45},"Main")
		tbs.tabs["Side"..i]=tab_info({img=cm.menu_img[4],x=930,y=290,sx=0.5,sy=0.5,ox=40,oy=45},"Side")
	end


end

function cm.draw()
	tab_draw(tbs.tabs["Main"])
	tab_draw(tbs.tabs["Side"])
	


end



return cm