local Animation = require("animation")

Character = {}

function Character:load()
    self.width = 24
    self.height = 32
    self.scale = 2
    self.speed = 250
    self.x = love.graphics.getWidth() / 2 - (self.width*self.scale) / 2
    self.y = love.graphics.getHeight() / 2 - (self.height*self.scale) / 2
    self.profile = "front"
    self.static = true
    self.frontWalk=Animation:new(Assets.Walker,{2,3,4,5,6,7,8},1)
    self.backWalk=Animation:new(Assets.Walker,{10,11,12,13,14,15,16},1)
    self.leftWalk=Animation:new(Assets.Walker,{18,19,20,21,22,23,24},1)
    self.rightWalk=Animation:new(Assets.Walker,{26,27,28,29,30,31,32},1)
    self.frontStop=Animation:new(Assets.Walker,{1},1)
    self.backStop=Animation:new(Assets.Walker,{9},1)
    self.leftStop=Animation:new(Assets.Walker,{17},1)
    self.rightStop=Animation:new(Assets.Walker,{25},1)
end

function Character:update(dt)
    self:move(dt)
    self:checkBoundaries()
    self:updateAnimation(dt)
end

function Character:move(dt)
    self.static = false
    if love.keyboard.isDown("up") then
        self.y = self.y - self.speed * dt
        self.profile = "back"
    elseif love.keyboard.isDown("down") then
        self.y = self.y + self.speed * dt
        self.profile = "front"
    elseif love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
        self.profile = "left"
    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
        self.profile = "right"
    else
        self.static = true
    end
end

function Character:checkBoundaries()
    local height = self.height*self.scale
    local width = self.width*self.scale
    if self.y < 0 then
        self.y = 0
    elseif self.y + height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - height
    end

    if self.x < 0 then
        self.x = 0
    elseif self.x + width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() - width
    end
end

function Character:updateAnimation(dt)
    if self.static==false then
        if self.profile == "front" then
            self.frontWalk:update(dt)
        elseif self.profile == "back" then
            self.backWalk:update(dt)
        elseif self.profile == "left" then
            self.leftWalk:update(dt)
        elseif self.profile == "right" then
            self.rightWalk:update(dt)
        end
    end
end

function Character:draw()
    if self.static then
        if self.profile == "front" then
            self.frontStop:drawNextSprite(self.x, self.y, self.scale)
        elseif self.profile == "back" then
            self.backStop:drawNextSprite(self.x, self.y, self.scale)
        elseif self.profile == "left" then
            self.leftStop:drawNextSprite(self.x, self.y, self.scale)
        elseif self.profile == "right" then
            self.rightStop:drawNextSprite(self.x, self.y, self.scale)
        end
    else
        if self.profile == "front" then
            self.frontWalk:drawNextSprite(self.x, self.y, self.scale)
        elseif self.profile == "back" then
            self.backWalk:drawNextSprite(self.x, self.y, self.scale)
        elseif self.profile == "left" then
            self.leftWalk:drawNextSprite(self.x, self.y, self.scale)
        elseif self.profile == "right" then
            self.rightWalk:drawNextSprite(self.x, self.y, self.scale)
        end
    end
end
