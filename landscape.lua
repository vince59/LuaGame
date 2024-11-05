local Animation = require("animation")
local json = require("json")

Landscape = {}

function Landscape:load()
    self.grass=Animation:new(Assets.Outdoor,{1},1)
    print(Assets.Outdoor:getSpriteNum(23,9))
    self.bush1=Animation:new(Assets.Outdoor,{Assets.Outdoor:getSpriteNum(7,263)},1)
    self.bush2=Animation:new(Assets.Outdoor,{Assets.Outdoor:getSpriteNum(23,263)},1)
    self.bush3=Animation:new(Assets.Outdoor,{Assets.Outdoor:getSpriteNum(40,246)},1)
end

function Landscape:update(dt)

end

function Landscape:draw()
    for y = 0, love.graphics.getHeight() - self.grass:getHeight(), self.grass:getHeight() do
        for x = 0, love.graphics.getWidth() - self.grass:getWidth(), self.grass:getWidth() do
            self.grass:drawNextSprite(x, y, 1)
        end
    end
    local x=30
    local y=60
    self.bush1:drawNextSprite(x,y,2)
    for x = 32,320,16 do
        self.bush2:drawNextSprite(x,y,2)
    end    
    self.bush3:drawNextSprite(30,y,2)
end
