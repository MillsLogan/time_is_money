function new_collectable(_x, _y, animation)
    local collectable = {
        x = _x, 
        y = _y,
        w = 8,
        h = 8,
        anim = animation,
        collected = false
    }

    function collectable:update()
        if self.collected then
            return
        end
        self.anim:update()
    end

    function collectable:draw()
        if self.collected then
            return
        end
        spr(self.anim.sp, self.x, self.y)
    end

    return collectable
end

function new_money(x, y)
    local money = new_collectable(x, y, new_animation(5, 8, 0.1, 4))
    
    function money:collect()
        sfx(0)
        self.collected = true
    end

    function money:check_collision(player)
        if self.collected then
            return
        end

        if player.x + player.w > self.x and player.x < self.x + self.w and player.y + player.h > self.y and player.y < self.y + self.h then
            self:collect()
            return true
        end
    end

    return money
end


