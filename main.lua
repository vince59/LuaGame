require("character")
require("parameters")

function love.load()
    Parameters:load()
    Character:load()
end

function love.update(dt)
    Character:update(dt)
end

function love.draw()
    Parameters.OutdoorTiles:drawSprite(Parameters.Tile1,10,30,10)
    Character:draw() 
end