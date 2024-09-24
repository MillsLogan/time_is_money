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
        self.anim:update()
    end

    function collectable:draw()
        spr(self.anim.sp, self.x, self.y)
    end

    return collectable
end

function new_money(x, y)
    local money = new_collectable(x, y, new_animation(5, 8, 0.1, 5))
    return money
end

