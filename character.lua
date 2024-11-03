Character = {}

function Character:load()
    self.width = 100
    self.height = 100
    self.speed = 500
    self.x = love.graphics.getWidth()/2 - self.width/2
    self.y = love.graphics.getHeight()/2 -self.height/2
end

function Character:update(dt)
    self:move(dt)
    self:checkBoundaries()
end

function Character:move(dt)
    if love.keyboard.isDown("up") then
        self.y = self.y -self.speed * dt
    elseif love.keyboard.isDown("down")  then
        self.y = self.y + self.speed * dt
    elseif love.keyboard.isDown("left") then
        self.x = self.x -self.speed * dt
    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    end
end

function Character:checkBoundaries()
    if self.y< 0 then
        self.y=0
    elseif self.y+self.height > love.graphics.getHeight() then
        self.y=love.graphics.getHeight() - self.height
    end

    if self.x< 0 then
        self.x=0
    elseif self.x+self.width > love.graphics.getWidth() then
        self.x=love.graphics.getWidth() - self.width
    end
end

function Character:draw()
    love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
end