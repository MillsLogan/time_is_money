player = {
    x = 0,
    y = 0,
    width = 8,
    height = 8,
    groundspeed = 0.25,
    airspeed = 0.025,
    dx = 0,
    dy = 0,
    onground = true,
    onwall = 0,
    jump_power = 2,
    gravity = 0.125,
    max_fall_speed = 4,
    animations = {
        idle = new_animation({64, 65, 66, 67, 68}, 0.3, 100),
        walk = new_animation({80, 81}, 0.25),
        onwall = new_animation({96}, 0)
    },
    current_animation = "walk",
    x_flip = false,
    y_flip = false
}

function player:process_input()
    local speed = 0
    if self.onground then
        self.dx = 0
        speed = self.groundspeed
    else
        self.dx = self.dx * 0.9 -- air resistance
        speed = self.airspeed
    end

    if btn(0) then
        self.dx = self.dx - speed
        self.x_flip = true
    end
    if btn(1) then
        self.dx = self.dx + speed
        self.x_flip = false
    end

    self:process_x_collisions()

    if self.dx == 0 then
        if self.current_animation ~= "idle" then
            self.current_animation = "idle"
            self.animations[self.current_animation]:reset()
        end
    else
        if self.current_animation ~= "walk" then
            self.current_animation = "walk"
            self.animations[self.current_animation]:reset()
        end
    end

    if self.onwall ~= 0 then
        if self.current_animation ~= "onwall" then
            self.current_animation = "onwall"
            if self.onwall == 1 then
                self.x_flip = false
            else
                self.x_flip = true
            end
            self.dy = 0
            self.animations[self.current_animation]:reset()
        end
    end
    

    if self.onground and btn(4) then
        self.dy = -self.jump_power
        self.onground = false
    elseif self.onwall ~= 0 and btn(4) then
        self.dy = -self.jump_power
        self.dx = self.dx + self.onwall * self.jump_power / 2
        self.onwall = 0
    else
        self.dy = self.dy + self.gravity
        if self.dy > self.max_fall_speed then
            self.dy = self.max_fall_speed
        end
    end
    self:process_x_collisions()
    self:process_y_collisisons()
end

function player:process_y_collisisons()
    local new_x = self.x
    local new_y = self.y + self.dy
    local x1 = flr(new_x / 8)
    local x2 = flr((new_x + self.width - 1) / 8)
    local y1 = flr(new_y / 8)
    local y2 = flr((new_y + self.height - 1) / 8)
    if self.dy > 0 then
        if fget(mget(x1, y2), 0) or fget(mget(x2, y2), 0) then
            self.y = y2 * 8 - self.height
            self.dy = 0
            self.onground = true
        else
            self.y = new_y
            self.onground = false
        end
    elseif self.dy < 0 then
        if fget(mget(x1, y1), 0) or fget(mget(x2, y1), 0) then
            self.y = y1 * 8 + 8
            self.dy = 0
            self.onground = false
        else
            self.y = new_y
            self.onground = false
        end
    end
end

function player:process_x_collisions()
    local new_x = self.x + self.dx
    local new_y = self.y
    local x1 = flr(new_x / 8)
    local x2 = flr((new_x + self.width) / 8)
    local y1 = flr(new_y / 8)
    local y2 = flr((new_y + self.height - 1) / 8)
    if self.dx > 0 then
        if fget(mget(x2, y1), 0) or fget(mget(x2, y2), 0) then
            self.x = x2 * 8 - self.width
            self.dx = 0
            self.onwall = -1
        else
            self.x = new_x
            self.onwall = 0
        end
    elseif self.dx < 0 then
        if fget(mget(x1, y1), 0) or fget(mget(x1, y2), 0) then
            self.x = x1 * 8 + self.width
            self.dx = 0
            self.onwall = 1
        else
            self.x = new_x
            self.onwall = 0
        end
    end
end

function player:update()
    self:process_input()
    self.animations[self.current_animation]:update()
end

function player:draw()
    self.animations[self.current_animation]:draw(self.x, self.y, self.x_flip, self.y_flip)
end