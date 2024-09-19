player = {
    anim = run_a,
    x = 20,
    y = 20,
    dx = 0,
    dy = 0,
    w = 8,
    h = 8,
    speed = 2,
    max_dx = 2,
    max_dy = 4,
    onground = false,
    jumppower = -4,
    xflp = false,
    isshot = false
 }
 
 
 function player:update()
    self:input()
    self:move()
    self:animate()
 end
 
 
 function player:draw()
    spr(self.anim.sp, self.x, self.y, 1, 1, self.xflp)
 end
 
 
 function player:animate()
    -- Idle
    if abs(self.dx) < .1 and self.dy == 0 then
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
    if self.isshot then
        return
    end
    self.dy = self.dy + gravity
    self.dx = self.dx * friction
    if btn(0) then
        self.dx -= 1
        self.xflp = true
    elseif btn(1) then
        self.dx += 1
        self.xflp = false
    end
    if btn(5) and self.onground then
        self.dy = self.jumppower
    end
 
 
    if self.onground then
        self.shotavailable = true
    end
 
 
    if not self.isshot and self.shotavailable then
        if btn(4) then
            self.isshot = true
            self.shotavailable = false
            if self.xflp then
                self.dx = -5
            else
                self.dx = 5
            end
        end
    end
 
 
    if not self.isshot then
        self:limit_speed()
    end
 end
 
 
 function player:limit_speed()
    if self.dx > self.max_dx then
        self.dx = self.max_dx
    elseif self.dx < -self.max_dx then
        self.dx = -self.max_dx
    end
    if self.dy > self.max_dy then
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
        if not collide_map({x=new_x, y=new_y, w=self.w, h=self.h}, "down", 0) then
            self.y = new_y
            self.onground = false
        else
            self.dy = 0
            self.onground = true
            self.y = flr(new_y/8)*8
        end
    elseif self.dy < 0 then
        if not collide_map({x=new_x, y=new_y, w=self.w, h=self.h}, "up", 0) then
            self.y = new_y
            self.onground = false
        else
            self.dy = 0
            self.y = flr(new_y/8)*8
        end
    end
 
 
    -- Horizontal collisions
    if self.dx > 0 then
        if not collide_map({x=new_x, y=self.y, w=self.w, h=self.h}, "right", 0) then
            self.x = new_x
        else
            self.dx = 0
            self.isshot = false
            self.x = flr((new_x+1)/8)*8
        end
    elseif self.dx < 0 then
        if not collide_map({x=new_x, y=self.y, w=self.w, h=self.h}, "left", 0) then
            self.x = new_x
        else
            self.dx = 0
            self.isshot = false
            self.x = flr((new_x+1)/8)*8
        end
    end
 end
 
 
 
 