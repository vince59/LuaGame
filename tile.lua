local Tile = {}

-- Constructor

function Tile:new(xPos,yPos)
    local instance={}
    setmetatable(instance, {__index = Tile})
    instance.xPos=xPos
    instance.yPos=yPos

    return instance
end

return Tile