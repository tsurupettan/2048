IH = require 'lib/imagehelper'
DefaultMoveSystem = require 'lib/MoveSystem'
Player = require 'lib/player'


function love.load()
	-- get Window Dimension
	win_width, win_height = love.graphics.getDimensions( )

	background = IH.createImageCanvas_Fit("background.jpg", 
										  win_width, 
										  win_height)
	pikachuCanvas = IH.createImageCanvas_Fit("pikachu.png", 100, 100)
	pikachu = Player:new(pikachuCanvas, 0 ,0)

	-- Initialize MoveSystem
	InitMoveSystem = DefaultMoveSystem:new()
	InitMoveSystem:addNode(pikachu)
end

function love.draw()
    -- Draw background
    love.graphics.setBlendMode('premultiplied')
    love.graphics.draw(background)

    --Draw Pikachu
    love.graphics.draw(pikachu.canvas, pikachu.position.x, 
    								   pikachu.position.y)
end


function love.update(dt)
	pikachu:updateInputs(dt)
	InitMoveSystem:update(dt)
end

