-- Authors: Marley Holt-Williams
local Player = require "Player"
local Ball = require "Ball"

windowWidth = 800
windowHeight = 600

-- Called once per game, setup only
function love.load()
    love.window.setTitle("CS489 Pong")
    windowWidth, windowHeight = love.graphics.getDimensions()
    gameState = "start"

    math.randomseed(os.time()) --random seed

    scoreFont = love.graphics.newFont(56)
    mainFont = love.graphics.newFont(28)

    player1 = Player(25)
    player2 = Player(windowWidth-35)
    ball = Ball()

    soundHit = love.audio.newSource("sounds/Blip_Select.wav","static")
    soundScore = love.audio.newSource("sounds/Pickup_Coin.wav","static")
end

-- Update our variables in the game loop
function love.update(dt)
    if gameState == "play" then
        player1:update(dt)
        player2:update(dt)
        ball:update(dt)

        if love.keyboard.isDown("w") then
            player1:moveUp(dt)
        elseif love.keyboard.isDown("s") then
            player1:moveDown(dt)
        end
            
        if love.keyboard.isDown("up") then
            player2:moveUp(dt)
        elseif love.keyboard.isDown("down") then
            player2:moveDown(dt)
        end

        if ball.x < 0 then
            player2:scoreUp()
            ball:reset()
        elseif ball.x > windowWidth then
            player1:scoreUp()
            ball:reset()
        end

        if ball.y <= 20 then -- ball hit the top wall
            ball:flipVertDir()
        elseif ball.y >= windowHeight-20 then 
            -- ball hit bottom wall
            ball:flipVertDir()
        end

        if player1:collision(ball) then
            -- collision happened
            ball:handleCollision()
            -- color would change
            ball:colorChange()
            soundHit:play()
        elseif player2:collision(ball) then
            -- collision with p2
            ball:handleCollision()
            -- color would change
            ball:colorChange()
            soundHit:play()
        end
    end

end

-- Draw here
function love.draw()
    if gameState == "start" then
        love.graphics.printf("CS489 Pong",scoreFont,0,100,windowWidth,"center")
        love.graphics.printf("Press Enter to Start \n or Escape to Exit",
        mainFont,0,170,windowWidth,"center")
    elseif gameState == "play"then
        player1:draw()
        player2:draw()

        ball:draw()

        love.graphics.print(player1.score,scoreFont,windowWidth/2-140,40)
        love.graphics.print(player2.score,scoreFont,windowWidth/2+100,40)
        net()
    elseif gameState == "done" then
        love.graphics.printf("It's Over!!!", scoreFont, 0, 100, windowWidth, "center")
        love.graphics.printf("And the winner is... " .. (winner == player1 and "Player 1" or "Player 2"), 
            mainFont, 0, 170, windowWidth, "center")
        love.graphics.printf("Press Enter to play again", mainFont, 0, 220, windowWidth, "center")
    end
    love.graphics.setLineWidth(5)
    love.graphics.line(0, 15, windowWidth, 15)
    love.graphics.line(0,windowHeight-20,windowWidth,windowHeight-20)
    
end

--Source I looked at
--https://love2d.org/wiki/love.graphics.line
function net()
    local x = windowWidth / 2
    love.graphics.line(x, 20, x, 30)
    love.graphics.line(x, 40, x, 50)
    love.graphics.line(x, 60, x, 70)
    love.graphics.line(x, 80, x, 90)
    love.graphics.line(x, 100, x, 110)
    love.graphics.line(x, 120, x, 130)
    love.graphics.line(x, 140, x, 150)
    love.graphics.line(x, 160, x, 170)
    love.graphics.line(x, 180, x, 190)
    love.graphics.line(x, 200, x, 210)
    love.graphics.line(x, 220, x, 230)
    love.graphics.line(x, 240, x, 250)
    love.graphics.line(x, 260, x, 270)
    love.graphics.line(x, 280, x, 290)
    love.graphics.line(x, 300, x, 310)
    love.graphics.line(x, 320, x, 330)
    love.graphics.line(x, 340, x, 350)
    love.graphics.line(x, 360, x, 370)
    love.graphics.line(x, 380, x, 390)
    love.graphics.line(x, 400, x, 410)
    love.graphics.line(x, 420, x, 430)
    love.graphics.line(x, 440, x, 450)
    love.graphics.line(x, 460, x, 470)
    love.graphics.line(x, 480, x, 490)
    love.graphics.line(x, 500, x, 510)
    love.graphics.line(x, 520, x, 530)
    love.graphics.line(x, 540, x, 550)
    love.graphics.line(x, 560, x, 570)
end

function resetGame()
    player1 = Player(25, windowHeight) 
    player2 = Player(windowWidth - 35, windowHeight)
    ball = Ball(windowWidth, windowHeight) 
     -- Reset scores
    player1.score = 0
    player2.score = 0
    gameState = "start" 
end



-- User input (not depended on time)
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "return" or key == "enter" then
        if gameState == "start" then
            gameState = "play"
        elseif gameState == "done" then 
            resetGame() 
        end
    end
end
