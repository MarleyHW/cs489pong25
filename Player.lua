local Class = require "hump.class"

local Player = Class{}
function Player:init(x) --constructor
    self.x = x
    self.y = windowHeight/2
    self.width = 10
    self.height = 80
    self.score = 0
end

function Player:draw()
    love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
end

function Player:update(dt)
end


return Player