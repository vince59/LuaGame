require("character")
require("assets")
require("landscape")
local json = require "json"

function love.load()
    Assets:load()
    Landscape:load()
    Character:load()
end

function love.update(dt)
    Character:update(dt)
end

function love.draw()
    Landscape:draw()
    Character:draw()
end