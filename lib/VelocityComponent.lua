local class = require 'lib/middleclass'

VelocityComponent = class('VelocityComponent')

function VelocityComponent:initialize(x,y,a)
	self.x = x or 0
	self.y = y or 0
	self.a = a or 0
end

return VelocityComponent