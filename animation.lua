function new_animation(frames, interval, start_delay)
    local anim = {}
    anim.frames = frames or {}
    anim.currentFrame = 1
    anim.timer = 0
    anim.interval = interval or 0.1
    anim.start_delay = start_delay or 0
    anim.started = false

    function anim:reset()
        self.currentFrame = 1
        self.timer = 0
        self.started = false
    end
    
    function anim:update()
        self.timer = self.timer + self.interval

        if not self.started then
            if self.timer >= self.start_delay then
                self.started = true
                self.timer = 0
            else
                return
            end
        end

        if self.timer >= 1 then
            self.currentFrame = self.currentFrame + 1
            self.timer = 0
        end
        if self.currentFrame > #self.frames then
            self.currentFrame = 1
            self.started = false
        end
    end
    
    function anim:draw(x, y, xflip, yflip)
        spr(self.frames[self.currentFrame], x, y, 1, 1, xflip, yflip)
    end

    return anim
end

