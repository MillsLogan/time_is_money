cam = {
    x = 0,
    y = 0,
    w = 128,
    h = 128
 }
 
 
 function cam:update()
    self.x = 0 --player.x - 64 + (player.w / 2)
    self.y = 0
    if self.x < map_start then
        self.x = map_start
    end
    if self.x > map_end - 128 then
        self.x = map_end - 128
    end
 
 
    camera(self.x, self.y)
 end
 
 