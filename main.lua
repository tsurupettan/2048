IH = require 'lib/imagehelper'
BasicDrawSystem = require 'lib/BasicDrawSystem'
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

	-- Initialize BasicDrawSystem
	InitDrawSystem = BasicDrawSystem:new()
	InitDrawSystem:addNode(pikachu)
end

function love.draw()
    -- Draw background
    love.graphics.draw(background)

    --Draw Pikachu
    InitDrawSystem:draw()
end

function love.update(dt)
	pikachu:updateInputs(dt)
	InitMoveSystem:update(dt)
end

