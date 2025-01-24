local Player = require "Player"

windowWidth = 800
windowHeight = 600

-- Called once per game, setup only
function love.load()
    love.window.setTitle("CS489 Pong")
    windowWidth, windowHeight = love.graphics.getDimensions()
    gameState = "start"

    scoreFont = love.graphics.newFont(56)
    mainFont = love.graphics.newFont(28)

    player1 = Player(25)
    player2 = Player(windowWidth-35)

end

-- Update our variables in the game loop
function love.update(dt)
end

-- Draw here
function love.draw()
    if gameState == "start" then
        love.graphics.printf("CS489 Pong",scoreFont,0,100,windowWidth,"center")
        love.graphics.printf("Press Enter to Start \n or Escape to Exit",
        mainFont,0,170,windowWidth,"center")
    elseif gameState == "play"then
    --                filled rect, x, y, width, height
        --love.graphics.rectangle("fill",25,windowHeight/2-40,10,80)
        --love.graphics.rectangle("fill",windowWidth-25,windowHeight/2,10,80)
        player1:draw()
        player2:draw()

        love.graphics.rectangle("fill",windowWidth/2-5,windowHeight/2-5,10,10)

        love.graphics.print("0",scoreFont,windowWidth/2-140,40)
        love.graphics.print("0",scoreFont,windowWidth/2+100,40)
    end

    love.graphics.setLineWidth(5)
    love.graphics.line(0, 15, windowWidth, 15)
    love.graphics.line(0,windowHeight-20,windowWidth,windowHeight-20)
end

-- User input (not depended on time)
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "return" and gameState=="start" then
        gameState = "play"
    end
end