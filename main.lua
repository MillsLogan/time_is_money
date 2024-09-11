function _init()

end

function _update60()
    player:update()
end

function _draw()
    cls()
    map(0,0,0,0,256, 256)
    player:draw()
end