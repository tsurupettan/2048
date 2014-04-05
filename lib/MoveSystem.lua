local class = require 'lib/middleclass'

MoveSystem = class('MoveSystem')

function MoveSystem:initialize( )
	self.targets = {}
end

function MoveSystem:size()
	return #self.targets
end

function MoveSystem:addNode( node )
	table.insert( self.targets, node )
end

function MoveSystem:update( dt )
	for i, target in ipairs(self.targets) do
		target.position.x = target.position.x + 
							target.velocity.x * dt
		target.position.y = target.position.y + 
							target.velocity.y * dt
	end
end

return MoveSystem