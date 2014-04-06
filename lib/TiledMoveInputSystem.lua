local class = require 'lib/middleclass'

TiledMoveInputSystem = class('TiledMoveInputSystem')

function TiledMoveInputSystem:initialize( moveWidth, moveHeight )
	self.moveWidth = moveWidth
	self.moveHeight = moveHeight
	
	self.targets = {}
end

function TiledMoveInputSystem:size()
	return #self.targets
end

function TiledMoveInputSystem:addNode( node )
	tileNode = {}
	tileNode.node = node
	tileNode.rft = 0
	table.insert( self.targets, tileNode )
end

moveTime = 0.5

function TiledMoveInputSystem:update( dt )
	for i, target in ipairs(self.targets) do
		if(target.rft == 0) then
			target.node.velocity.x = 0
			target.node.velocity.y = 0
			if love.keyboard.isDown("right") then
				target.rft = moveTime
				target.node.velocity.x = 100
			end
			if love.keyboard.isDown("left") then
				target.rft = moveTime
				target.node.velocity.x = -100
			end
			if love.keyboard.isDown("up") then
				target.rft = moveTime
				target.node.velocity.y = -100 
			end
			if love.keyboard.isDown("down") then
				target.rft = moveTime
				target.node.velocity.y = 100 
			end
		else
			target.rft = math.max(target.rft - dt, 0)
		end
	end
end

return TiledMoveInputSystem