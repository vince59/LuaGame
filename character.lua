Character = {}

function Character:load()
    self.width = 24
    self.height = 32
    self.scale = 2
    self.animation = self:newAnimation(love.graphics.newImage("assets/rpg_sprite_walk.png"), self.width, self.height, 1)
    self.speed = 250
    self.x = love.graphics.getWidth() / 2 - (self.width*self.scale) / 2
    self.y = love.graphics.getHeight() / 2 - (self.height*self.scale) / 2
    self.profile = "front"
    self.static = true
end

function Character:update(dt)
    self:move(dt)
    self:checkBoundaries()
    self.animation.currentTime = self.animation.currentTime + dt
    if self.animation.currentTime >= self.animation.duration then
        self.animation.currentTime = self.animation.currentTime - self.animation.duration
    end
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

function Character:draw()
    local spriteNum
    if self.static then
        if self.profile == "front" then
            spriteNum = 1
        elseif self.profile == "back" then
            spriteNum = 9
        elseif self.profile == "left" then
            spriteNum = 17
        elseif self.profile == "right" then
            spriteNum = 25
        end
        self.animation.currentTime = 0
    else
        spriteNum = math.floor(self.animation.currentTime / self.animation.duration * 8) + 1
        if self.profile == "back" then
            spriteNum = spriteNum + 8
        elseif self.profile == "left" then
            spriteNum = spriteNum + 16
        elseif self.profile == "right" then
            spriteNum = spriteNum + 24
        end
    end
    love.graphics.draw(self.animation.spriteSheet, self.animation.quads[spriteNum], self.x, self.y, 0, self.scale)
end

function Character:newAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    animation.duration = duration or 1
    animation.currentTime = 0

    return animation
end
