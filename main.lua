windowWidth = 800
windowHeight = 600

-- Called once per game, setup only
function love.load()
end

-- Update our variables in the game loop
function love.update(dt)
end

-- Draw here
function love.draw()
    --                filled rect, x, y, width, height
    love.graphics.rectangle("fill",25,50,10,80)
    love.graphics.rectangle("fill",windowWidth-25,50,10,80)
end

-- User input (not depended on time)
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end