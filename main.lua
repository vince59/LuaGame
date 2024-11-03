
require("character")

function love.load()
    Character:load()
end

function love.update(dt)
    Character:update(dt)
end

function love.draw()
    Character:draw()
end