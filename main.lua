--variables


function _init()
  timer=5
  gravity=0.35
  groundfriction=0.70
  airfriction=0.98
  collectables = {new_money(6*8, 13*8), new_money(37*8, 25*8), new_money(11*8, 24*8), new_money(37*8, 10*8), new_money(21*8, 11*8), new_money(28*8, 21*8)}
  enemies = {new_fly(35*8,16*8), new_fly(26*8, 25*8), new_fly(23*8, 7*8, false)}
  extra_time=3
  collected_money=0
  --map limits
  map_start=0
  map_end=41*8
  map_top=0
  map_bottom=27*8
  has_won = false
  tries = 0
end
    

function main_screen()
  cls()
  print("time", 28, 32, 8)
  print("is", 46, 32, 8)
  print("money", 58, 32, 11)
  print("get to the painting before ", 8, 48, 7)
  print("time", 28, 56, 11)
  print("runs out", 48, 56, 7)
  print("press c to start", 64, 120, 7)
  if btnp(4) then
    started = true
    hard_reset()
  end
end

function hard_reset()
  tries = 0
  collected_money = 0
  has_won = false
  started = true
  reset()
  for i=1,#collectables do
    collectables[i].collected = false
  end
end

function reset()
  tries+=1
  player:reset()
  timer=5 + collected_money*extra_time
  enemies = {new_fly(35*8,16*8), new_fly(26*8, 25*8, true), new_fly(23*8, 7*8, false)}
end

function _update()
  if not started or has_won then
    return
  end

  timer-=0.033

  if timer<=0 then
    reset()
    return
  end
  local prev_player_y=player.y
  
  player:update()
  for i=1,#collectables do
    collectables[i]:check_collision(player)
    collectables[i]:update()
  end

  for i=1,#enemies do
    enemies[i]:check_collision(player, prev_player_y)
    enemies[i]:update()
  end
  
  cam:update()
end
   
function death()
  reset()
end

function _draw()
  if not started then
    main_screen()
    return
  end
  
  
  if has_won then
    cls()
    print("you win!", cam.x+24, cam.y+60, 7)
    print("thanks for playing", cam.x+24, cam.y+70, 7)
    print("press c to restart", cam.x+24, cam.y+90, 7)
    print("time remaining: "..timer, cam.x+24, cam.y+100, 7)
    print("tries: "..tries, cam.x+24, cam.y+110, 7)
    player.anim = idol_a
    player.anim:update()
    player.y = cam.y + 80
    player.x = cam.x + 53
    player:draw()
    if btnp(4) then
      has_won = false
      hard_reset()
      money_collected = 0
    end
    return
  end
  cls()
  map(0,0)
  for i=1,#collectables do
    collectables[i]:draw()
  end

  for i=1,#enemies do
    enemies[i]:draw()
  end

  player:draw()
  print("time: "..timer, cam.x, cam.y, 7)
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

function win()
  has_won = true
end
   
   