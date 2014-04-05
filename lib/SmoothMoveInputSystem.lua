local class = require 'lib/middleclass'

SmoothMoveInputSystem = class('SmoothMoveInputSystem')

function SmoothMoveInputSystem:initialize( )
	self.targets = {}
end

function SmoothMoveInputSystem:size()
	return #self.targets
end

function SmoothMoveInputSystem:addNode( node )
	table.insert( self.targets, node )
end

function SmoothMoveInputSystem:update( dt )
	for i, target in ipairs(self.targets) do
		target.velocity.x = 0
		target.velocity.y = 0

		if love.keyboard.isDown("right") then
			target.velocity.x = target.velocity.x + 500 
		end
		if love.keyboard.isDown("left") then
			target.velocity.x = target.velocity.x - 500 
		end
		if love.keyboard.isDown("up") then
			target.velocity.y = target.velocity.y - 500 
		end
		if love.keyboard.isDown("down") then
			target.velocity.y = target.velocity.y + 500 
		end
	end
end

return SmoothMoveInputSystem