function new_animation(min, max, delay, start_delay)
    local animation = {
        sp = min,
        start_delay = start_delay,
        lowest_spr = min,
        max_spr = max,
        spr_delay = delay,
        timer = time(),
    }
 
 
    function animation:update()
        if not self.started and time() - self.timer < self.start_delay then
            return
        else
            self.started = true
        end
        if time() - self.timer > self.spr_delay then
            self.timer = time()
            self.sp += 1
            if self.sp > self.max_spr then
                self.sp = self.lowest_spr
                if self.start_delay > 0 then
                    self.started = false
                end
            end
        end
    end
    return animation
end
 
 
 
 
run_a = new_animation(69, 71, 0.1, 0)
idol_a = new_animation(64, 68, 0.2, 4)
jump_a = new_animation(72, 72, 0, 0)
fall_a = new_animation(73, 74, 0.1, 0)
slide_a = new_animation(75, 75, 0.1, 0)
wallslide_a = new_animation(76, 76, 0, 0)
 