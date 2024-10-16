player = {
    anim = idol_a,
    x = 24,
    y = 24,
    dx = 0,
    dy = 0,
    w = 8,
    h = 8,
    groundspeed = 0.5,
    airspeed = 0.25,
    max_dx = 2,
    max_dy = 4,
    onground = false,
    jumppower = -3.2,
    walljump = 1.5,
    xflp = true,
    onwall = "none",
    double_available = true
 }
 
 function player:reset()
    self.x = 24
    self.y = 24
    self.dx = 0
    self.dy = 0
    self.xflp = true
    self.onwall = "none"
 end

function player:update()
    self:input()
    self:move()
    self:animate()
 end
 
 
function player:draw()
    spr(self.anim.sp, self.x, self.y, 1, 1, self.xflp)
end
 
 
function player:animate()
    if self.onwall ~= "none" then
        self.anim = wallslide_a
    elseif abs(self.dx) < .1 and self.dy == 0 then
        self.anim = idol_a
    elseif self.dy == 0 then
        if abs(self.dx) > 0 and not btn(0) and not btn(1) then
            self.anim = slide_a
        else
            self.anim = run_a
        end
    
    elseif self.dy > 0 then
        self.anim = fall_a
    elseif self.dy < 0 then
        self.anim = jump_a
    end
    self.anim:update()
end
 
 
function player:input()
    if self.onwall == "none" then
        self.dy = self.dy + gravity
    else
        if self.dy > 0 then
            self.dy = self.dy + gravity / 2
        else
            self.dy = self.dy + gravity
        end
    end
    
    if self.onground then
        self.dx = self.dx * groundfriction
    else
        self.dx = self.dx * airfriction
    end


    if btn(0) then
        if self.onground then
            self.dx -= self.groundspeed
        else
            self.dx -= self.airspeed
        end
        self.xflp = true
    elseif btn(1) then
        if self.onground then
            self.dx += self.groundspeed
        else
            self.dx += self.airspeed
        end
        self.xflp = false
    end
    
    player:limit_speed()

    if btn(5) and self.onground then
        self.dy = self.jumppower
    elseif btnp(5) and self.onwall == "right" then
        self.dy = self.jumppower
        self.dx = -self.walljump
        self.onwall = "none"
    elseif btnp(5) and self.onwall == "left" then
        self.dy = self.jumppower
        self.dx = self.walljump
        self.onwall = "none"
    elseif btnp(5) and self.onwall == "none" and self.double_available then
        self.dy = self.jumppower
        self.double_available = false
        sfx(7)
        double_jumps[#double_jumps+1] = {x=self.x, y=self.y+8, timer=0}
        timer -= 0.5
    end
end

function player:death()
    spr(64, self.x, self.y, 1, 1, self.xflp, true)
end
 
 
function player:limit_speed()
    if self.dx > self.max_dx then
        self.dx = self.max_dx
    elseif self.dx < -self.max_dx then
        self.dx = -self.max_dx
    end

    if self.onwall ~= "none" then
        if self.dy > self.max_dy/4 then
            self.dy = self.max_dy/4
        end
    elseif self.dy > self.max_dy then
        self.dy = self.max_dy
    elseif self.dy < -self.max_dy then
        self.dy = -self.max_dy
    end
end
 
 
function player:move()
    local new_x = self.x + self.dx
    local new_y = self.y + self.dy
   
    -- Vertical collisions
    if self.dy > 0 then
        if not collide_map({x=new_x, y=new_y, w=self.w, h=self.h}, "down", 0) and 
        not collide_map({x=new_x, y=new_y, w=self.w, h=self.h}, "down", 1) then
            self.y = new_y
            self.onground = false
        else
            self.dy = 0
            self.y = flr(new_y/8)*8
            self.onground = true
            self.double_available = true
        end
    elseif self.dy < 0 then
        if not collide_map({x=new_x, y=new_y, w=self.w, h=self.h}, "up", 0) then
            self.y = new_y
            self.onground = false
        else
            self.dy = ceil(self.dy/2)
            self:move()
        end
    end
 
 
    -- Horizontal collisions
    if self.dx > 0 then
        if not collide_map({x=new_x, y=self.y, w=self.w, h=self.h}, "right", 0) then
            self.x = new_x
            self.onwall = "none"
        else
            self.dx = 0
            self.x = flr((new_x+1)/8)*8
            self.onwall = "right"
        end
    elseif self.dx < 0 then
        if not collide_map({x=new_x, y=self.y, w=self.w, h=self.h}, "left", 0) then
            self.x = new_x
            self.onwall = "none"
        else
            self.dx = 0
            self.x = flr((new_x+1)/8)*8
            self.onwall = "left"
        end
    else
        self.onwall = "none"
    end

    if collide_map(self, "down", 2) then
        win()
    end
end
 
 
 
 