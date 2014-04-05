
IH = require 'lib/imagehelper'
BasicDrawSystem = require 'lib/BasicDrawSystem'
BasicMoveSystem = require 'lib/BasicMoveSystem'
SmoothMoveInputSystem = require 'lib/SmoothMoveInputSystem'
Player = require 'lib/player'
Background = require 'lib/Background'

function love.load()
	-- get Window Dimension
	win_width, win_height = love.graphics.getDimensions( )

	sky = Background:new("background.jpg", 
						 win_width, 
						 win_height)

	pikachuCanvas = IH.createImageCanvas_Fit("pikachu.png", 100, 100)
	pikachu = Player:new(pikachuCanvas, 0 ,0)

	-- Initialize MoveSystem
	InitMoveSystem = BasicMoveSystem:new()
	InitMoveSystem:addNode(pikachu:getMoveNode())

	--Intialzie InputSystem
	InitialMoveInputSystem = SmoothMoveInputSystem:new()
	InitialMoveInputSystem:addNode(pikachu:getMoveNode())

	-- Initialize BasicDrawSystem
	InitDrawSystem = BasicDrawSystem:new()
	InitDrawSystem:addNode(sky:getRenderNode())
	InitDrawSystem:addNode(pikachu:getRenderNode())	
end

function love.update(dt)
	-- pikachu:updateInputs(dt)
	InitialMoveInputSystem:update(dt)
	InitMoveSystem:update(dt)
end

function love.draw()
    InitDrawSystem:draw()
end
