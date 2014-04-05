local class = require 'lib/middleclass'

BasicMoveSystem = class('BasicMoveSystem')

function BasicMoveSystem:initialize( )
	self.targets = {}
end

function BasicMoveSystem:size()
	return #self.targets
end

function BasicMoveSystem:addNode( node )
	table.insert( self.targets, node )
end

function BasicMoveSystem:update( dt )
	for i, target in ipairs(self.targets) do
		target.position.x = target.position.x + 
							target.velocity.x * dt
		target.position.y = target.position.y + 
							target.velocity.y * dt
	end
end

return BasicMoveSystem