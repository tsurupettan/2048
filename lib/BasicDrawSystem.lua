local class = require 'lib/middleclass'

BasicDrawSystem = class('BasicDrawSystem')

function BasicDrawSystem:initialize( )
	self.targets = {}
end

function BasicDrawSystem:size()
	return #self.targets
end

function BasicDrawSystem:addNode( node )
	table.insert( self.targets, node )
end

function BasicDrawSystem:draw()
	love.graphics.setBlendMode('premultiplied')
	for i, target in ipairs(self.targets) do
    	love.graphics.draw(	target.canvas, 
    						target.position.x, 
    						target.position.y)
	end
end

return BasicDrawSystem