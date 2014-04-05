IH = require 'lib/imagehelper'
Player = require 'lib/player'

function love.load()
	win_width, win_height = love.graphics.getDimensions( )

	background = IH.createImageCanvas_Fit("background.jpg", win_width, win_height)
	pikachuCanvas = IH.createImageCanvas_Fit("pikachu.png", 100, 100)
	pikachu = Player:new(pikachuCanvas, 0 ,0)
end

function love.draw()
    -- love.graphics.setColor(255, 255, 255, 255)
	
    -- Draw background
    love.graphics.setBlendMode('premultiplied')
    love.graphics.draw(background)

    --Draw Pikachu
    love.graphics.draw(pikachu.canvas, pikachu.x, pikachu.y)
end


function love.update(dt)
	pikachu:update(dt)
end

