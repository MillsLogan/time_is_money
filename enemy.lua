function new_enemy(_x, _y, animation)
    local enemy = {
        x = _x, 
        y = _y,
        w = 8,
        h = 8,
        anim = animation,
        defated = false
    }

    function enemy:update()
        if self.defated then
            return
        end
        self.anim:update()
    end

    function enemy:draw()
        if self.defeated then
            return
        end
        spr(self.anim.sp, self.x, self.y)
    end

    return enemy
end

function new_fly(x, y)
    local fly = new_enemy(x,y, new_animation(80,83,0.1,0))

    function fly:check_collision(player)
        if self.defeated then
            return
        end

        if player.x + player.w > self.x and player.x < self.x + self.w and player.y + player.h > self.y and player.y < self.y + self.h then
            player.dy = player.jumppower
            self.defeated = true
            return true
        end
    end
    return fly
end