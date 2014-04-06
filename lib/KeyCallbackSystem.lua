local class = require 'lib/middleclass'

KeyCallbackSystem = class('KeyCallbackSystem')

function KeyCallbackSystem:initialize()
	self.targets = {}
end

function KeyCallbackSystem:size()
	return #self.targets
end

function KeyCallbackSystem:addNode( nodefunc )
	table.insert( self.targets, nodefunc )
end

function KeyCallbackSystem:update( pressed, key, isrepeat )
	for i, target in ipairs( self.targets ) do
		target.func( pressed, key, isrepeat, target )
	end
end

return KeyCallbackSystem