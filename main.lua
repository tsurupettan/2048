
IH = require 'lib/imagehelper'
BasicDrawSystem = require 'lib/BasicDrawSystem'
BasicMoveSystem = require 'lib/BasicMoveSystem'
SmoothMoveInputSystem = require 'lib/SmoothMoveInputSystem'
TiledMoveInputSystem = require 'lib/TiledMoveInputSystem'
Player = require 'lib/player'
Background = require 'lib/Background'

function love.load()
	-- get Window Dimension
	win_width, win_height = love.graphics.getDimensions( )

	-- Initialize Entities
	sky = Background:new("background.jpg", 
						 win_width, 
						 win_height)
	sky:drawGrid(100,100)


	pikachuCanvas = IH.createImageCanvas_Fit("pikachu.png", 100, 100)
	pikachu = Player:new(pikachuCanvas, 0 ,0)

	-- Initialize MoveSystem
	InitMoveSystem = BasicMoveSystem:new()
	InitMoveSystem:addNode(pikachu:getMoveNode())

	--Intialzie InputMoveSystem
	InitialMoveInputSystem = SmoothMoveInputSystem:new()
	-- InitialMoveInputSystem:addNode(pikachu:getMoveNode())

	tMoveSystem = TiledMoveInputSystem:new()
	tMoveSystem:addNode(pikachu:getMoveNode())

	-- Initialize BasicDrawSystem
	InitDrawSystem = BasicDrawSystem:new()
	InitDrawSystem:addNode(sky:getRenderNode())
	InitDrawSystem:addNode(pikachu:getRenderNode())	
end

function love.update(dt)
	InitialMoveInputSystem:update(dt)
	tMoveSystem:update(dt)

	InitMoveSystem:update(dt)
end

function love.draw()
    InitDrawSystem:draw()
end
