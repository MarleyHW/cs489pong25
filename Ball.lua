local Class = require "hump.class"

local Ball = Class{}
function Ball:init() -- constructor
    self.x = windowWidth/2 -5
    self.y = windowHeight/2 -5
    self.size = 10
    self.speedX = math.random(200,300)
    self.speedY = math.random(-100,100)

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
    love.graphics.rectangle("fill",self.x,self.y,self.size,self.size)
end

function Ball:update(dt)
    self.x = self.x + self.speedX*dt
    self.y = self.y + self.speedY*dt
end

return Ball