
IH = require 'lib/imagehelper'
BasicDrawSystem = require 'lib/BasicDrawSystem'
BasicMoveSystem = require 'lib/BasicMoveSystem'
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
	InitMoveSystem:addNode(pikachu)

	-- Initialize BasicDrawSystem
	InitDrawSystem = BasicDrawSystem:new()
	
	InitDrawSystem:addNode(sky)
	InitDrawSystem:addNode(pikachu)
end

function love.draw()
    InitDrawSystem:draw()
end

function love.update(dt)
	pikachu:updateInputs(dt)
	InitMoveSystem:update(dt)
end

