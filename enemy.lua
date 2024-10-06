function new_enemy(_x, _y, animation, _flip)
    local enemy = {
        x = _x, 
        y = _y,
        w = 8,
        h = 8,
        anim = animation,
        flip = _flip,
        defeated = false,
        distance = 0
    }

    function enemy:update()
        if self.defeated and self.distance > 8 then
            return
        elseif self.defeated then
            self.distance += 1
            self.y += 1
            return
        end

        self.anim:update()
    end

    function enemy:draw()
        if self.defeated and self.distance > 8 then
            return
        end
        spr(self.anim.sp, self.x, self.y, 1, 1, self.flip, self.defeated)
    end

    return enemy
end

function new_fly(x, y, flip)
    local fly = new_enemy(x,y, new_animation(80,83,0.01,0), flip)

    function fly:check_collision(player, prev_player_y)
        if self.defeated then
            return
        end

        if player.x + player.w > self.x and player.x < self.x + self.w and player.y + player.h > self.y and player.y < self.y + self.h then
            if prev_player_y + player.h <=self.y then
                sfx(6)
                self.defeated = true
                player.dy = player.jumppower
            else
                death = true
                death_screen()
            end
        end
    end
    return fly
end