local class = require 'lib/middleclass'

MoveNode = class('MoveNode')

function MoveNode:initialize( position, velocity )
	self.position = position
	self.velocity = velocity
end

return MoveNode