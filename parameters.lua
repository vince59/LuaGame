local TileSet = require("tileSet")
local Tile = require("tile")
Parameters = {}

function Parameters:load()
    self.OutdoorTiles = TileSet:new("assets/Overworld.png", 16, 16)
    self.OutdoorTiles:load()
    self.Tile1 = Tile:new(10,10)
end