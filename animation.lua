local Animation = {}

-- Constructor

function Animation:new(tiles,sprites,duration)
    local instance={}
    setmetatable(instance, {__index = Animation})
    instance.currentTime=0
    instance.duration = duration or 1
    instance.sprites=sprites
    instance.tiles=tiles
    return instance
end

function Animation:getHeight()
    return self.tiles.height
end

function Animation:getWidth()
    return self.tiles.width
end

function Animation:update(dt)
    self.currentTime = self.currentTime + dt
    if self.currentTime >= self.duration then
        self.currentTime = self.currentTime - self.duration
    end
end

function Animation:drawNextSprite(x,y,scale)
    local spriteNum = math.floor(self.currentTime / self.duration * #self.sprites) + 1
    self.tiles:drawSprite(self.sprites[spriteNum],x,y,scale)
end

return Animation