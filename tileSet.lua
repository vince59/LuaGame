local TileSet = {}

-- Constructor

function TileSet:new(imagePath, width, height)
    local instance={}
    setmetatable(instance, {__index = TileSet})
    instance.imagePath=imagePath
    instance.width=width
    instance.height=height

    return instance
end

function TileSet:drawSprite(tile,x,y,scale)
    local nbLine=math.floor(tile.yPos/self.height)
    local nbCol=math.floor(tile.xPos/self.width)
    if nbCol==0 then
        nbCol=1
    end
    local spriteNumber= nbLine*self.nbCol+nbCol
    love.graphics.draw(self.spriteSheet, self.quads[spriteNumber], x,y, 0, scale)
end

function TileSet:load()
    self.spriteSheet = love.graphics.newImage(self.imagePath)
    self.quads = {};
    self.nbCol=self.spriteSheet:getWidth()/self.width
    self.nbLine=self.spriteSheet:getHeight()/self.height
    for y = 0, self.spriteSheet:getHeight() - self.height, self.height do
        for x = 0, self.spriteSheet:getWidth() - self.width, self.width do
            table.insert(self.quads, love.graphics.newQuad(x, y, self.width, self.height, self.spriteSheet:getDimensions()))
        end
    end
end

return TileSet