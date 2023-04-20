push = require 'push'
Class = require 'class'
require 'Player'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243
speed=80
circle_x= 0+20
circle_y=VIRTUAL_HEIGHT/2

gameState = 'play'
function love.load()

    love.graphics.setDefaultFilter('nearest', 'nearest')
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync= true

    })

    big_font = love.graphics.newFont('font.ttf', 36)
    love.graphics.setFont(big_font)

    player1 = Player(10,20,40,40)
    player2 = Player(50,50,40,40)


end

function love.keypressed(key)
    if key == 'q' then
        love.event.quit()
    end
    if key == 'space' and gameState == 'play' then
        gameState = 'paused'
    elseif  key == 'space' and gameState == 'paused' then
        gameState = 'play'
    end
end

function love.update(dt)
    circle_x = math.min( VIRTUAL_WIDTH-20, circle_x + speed * dt)
    if circle_x == VIRTUAL_WIDTH-20 then
        circle_x = math.max(0, circle_x - speed * dt)
    end
    
    if gameState == 'play' then 
        if love.keyboard.isDown('d') then
            player1.x = math.min( VIRTUAL_WIDTH-40, player1.x + speed * dt ) 
        end
         if love.keyboard.isDown('a') then
            player1.x = math.max (0, player1.x - speed * dt )
        end
        if love.keyboard.isDown('w') then
            player1.y = math.max( 0, player1.y - speed * dt) 
        end

        if love.keyboard.isDown('s') then
            player1.y = math.min( VIRTUAL_HEIGHT-40, player1.y + speed * dt) 
        end

        if love.keyboard.isDown('right') then
            player2.x = math.min( VIRTUAL_WIDTH-40, player2.x + speed * dt )
        end
        if love.keyboard.isDown('left') then
            player2.x = math.max (0, player2.x - speed * dt )
        end

        if love.keyboard.isDown('up') then
            player2.y = math.max( 0, player2.y - speed * dt) 
        end

        if love.keyboard.isDown('down') then
            player2.y = math.min( VIRTUAL_HEIGHT-40, player2.y + speed * dt) 
        end
    end
end

function love.draw()
    push:apply('start')

    love.graphics.clear(100/255, 0/255, 200/255, 255/255)

    player1:render()
    player2:render()
  
    love.graphics.circle('fill', circle_x, circle_y, 20)
   
    push:apply('end')
end
