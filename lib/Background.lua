local class = require 'lib/middleclass'

local IH = require 'lib/imagehelper'
local PositionComponent = require 'lib/PositionComponent'

Background = class('Background')

function Background:initialize(img, x, y, name)
	self.canvas = IH.createImageCanvas_Fit(img, x, y );
	self.position = PositionComponent:new()
	self.name = name or "Background"
end

function Background:drawGrid(width, height)
	win_width, win_height = love.graphics.getDimensions( )
	love.graphics.setCanvas(self.canvas)

		love.graphics.setColor(0,0,0)
		for loc_x = 0, win_width, width do 
			love.graphics.line(loc_x, 0, loc_x, win_height)
		end
		for loc_y = 0, win_height, height do 
			love.graphics.line(0 ,loc_y, win_width, loc_y)
		end
		love.graphics.setColor(255,255,255)
	love.graphics.setCanvas()
end

function Background:getRenderNode()
	return RenderNode:new( self.canvas, self.position )
end
return Background