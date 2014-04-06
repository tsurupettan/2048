local class = require 'lib/middleclass'

KeyCallbackSystem.lua = class('KeyCallbackSystem.lua')

function KeyCallbackSystem.lua:initialize()
	self.targets = {}
end

function KeyCallbackSystem.lua:size()
	return #self.targets
end

function KeyCallbackSystem.lua:addNode( nodefunc )
	table.insert( self.targets, nodefunc )
end

function KeyCallbackSystem.lua:update( pressed, key, isrepeat )
	for i, target in ipairs(self.targets) do
		target.func( pressed, key, isrepeat, target.node)
	end
end

return KeyCallbackSystem.lua