local Class = require "hump.class"

local Ball = Class{}
function Ball:init() -- constructor
    self.x = windowWidth/2 -5
    self.y = windowHeight/2 -5
    self.size = 10
    self.speedX = math.random(200,300)
    self.speedY = math.random(-100,100)
    -- Colors that will be selected
    -- Cool source that has a lot of colors: https://love2d.org/forums/viewtopic.php?t=81151
    self.colors = {
        {1, 0, 0},    
        {0, 1, 0},   
        {0, 0, 1},   
        {1, 1, 0},   
    }
    self.currentColor = self.colors[1]
    if math.random(2) == 1 then 
        self.speedX = self.speedX * -1
    end
end

function Ball:reset()
    self.x = windowWidth/2 -5
    self.y = windowHeight/2 -5
    self.speedX = math.random(200,300)
    self.speedY = math.random(-100,100)

    if math.random(2) == 1 then 
        self.speedX = self.speedX * -1
    end

end

function Ball:draw()
    love.graphics.setColor(self.currentColor)
    love.graphics.rectangle("fill",self.x,self.y,self.size,self.size)
    love.graphics.setColor(1, 1, 1, 1)
end

function Ball:update(dt)
    self.x = self.x + self.speedX*dt
    self.y = self.y + self.speedY*dt
end

function Ball:flipVertDir()
    self.speedY = self.speedY * -1
end

function Ball:flipHorDir()
    self.speedX = self.speedX * -1
end

function Ball:handleCollision()
    self:flipHorDir()
    self.speedX = self.speedX * 1.1
    self.speedY = math.random(-100,100)
end

function Ball:colorChange()
newColor = self.colors[math.random(#self.colors)]
if newColor == self.currentColor then
    newColor = self.colors[math.random(#self.colors)] 
end
self.currentColor = newColor
end

return Ball