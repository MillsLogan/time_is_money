function new_collectable(_x, _y, animation)
    local collectable = {
        x = _x, 
        y = _y,
        w = 8,
        h = 8,
        anim = animation,
        collected = false,
        show_collect = true,
        distance = 0 --distance travelled after collection
    }

    function collectable:update()
        if self.collected and not self.show_collect then
            return
        elseif self.collected and self.show_collect then
            self.distance += 1
            if self.distance > 16 then
                self.show_collect = false
            end
        end

        self.anim:update()
    end

    function collectable:draw()
        if self.collected and not self.show_collect then
            return
        elseif self.collected and self.show_collect then
            print("+3s", self.x, self.y-self.distance, 11)
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
        collected_money += 1
        timer += 3
        print("+3s", self.x, self.y, 11)
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


