--variables


function _init()
  gravity=0.3
  groundfriction=0.85
  airfriction=0.98
  collectables = {new_money(0, 164), new_money(10, 164), new_money(20, 164)}


  --map limits
  map_start=0
  map_end=1024
end
    

function _update()
  for i=1,#collectables do
    collectables[i]:update()
  end
  player:update()
  cam:update()
end
   

function _draw()
  cls()
  map(0,0)
  for i=1,#collectables do
    collectables[i]:draw()
  end
  player:draw()
  print("time: "..ceil(time()*10)/10, cam.x, cam.y, 7)
end

function collide_map(obj,aim,flag)
  --obj = table needs x,y,w,h
  --aim = left,right,up,down


  local x=obj.x  local y=obj.y
  local w=obj.w  local h=obj.h


  local x1=0   local y1=0
  local x2=0  local y2=0


  if aim=="left" then
    x1=x-1  y1=y
    x2=x    y2=y+h-1


  elseif aim=="right" then
    x1=x+w-1    y1=y
    x2=x+w  y2=y+h-1


  elseif aim=="up" then
    x1=x+2    y1=y-1
    x2=x+w-3  y2=y


  elseif aim=="down" then
    x1=x+2      y1=y+h
    x2=x+w-3    y2=y+h
  end


  --pixels to tiles
  x1/=8    y1/=8
  x2/=8    y2/=8


  if fget(mget(x1,y1), flag)
  or fget(mget(x1,y2), flag)
  or fget(mget(x2,y1), flag)
  or fget(mget(x2,y2), flag) then
    return true
  else
    return false
  end
end
   
   