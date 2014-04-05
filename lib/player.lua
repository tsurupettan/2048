local class = require 'lib/middleclass'

local PositionComponent = require 'lib/PositionComponent'
local VelocityComponent = require 'lib/VelocityComponent'

local MoveNode = require 'lib/MoveNode'
local RenderNode = require 'lib/RenderNode'

Player = class('Player')

function Player:initialize(canvas, x, y)
	self.canvas = canvas
	self.position = PositionComponent:new(x,y)
	self.velocity = VelocityComponent:new()
end

function Player:getMoveNode( )
	return MoveNode:new( self.position, self.velocity)
end

function Player:getRenderNode()
	return RenderNode:new( self.canvas, self.position )
end

return Player