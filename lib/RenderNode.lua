local class = require 'lib/middleclass'

RenderNode = class('RenderNode')

function RenderNode:initialize( canvas, position )
	self.canvas = canvas
	self.position = position
end

return RenderNode