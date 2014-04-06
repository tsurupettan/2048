local class = require 'lib/middleclass'

TiledMoveInputSystem = class('TiledMoveInputSystem')

function TiledMoveInputSystem:initialize( keyCallBackSystem, 
										  moveWidth, moveHeight )
	self.keyCallBackSystem = keyCallBackSystem
	self.moveWidth = moveWidth
	self.moveHeight = moveHeight
	
	self.targets = {}
end

function TiledMoveInputSystem:size()
	return #self.targets
end

local tiledMoveUp    = 1
local tiledMoveDown  = 2
local tiledMoveLeft  = 3
local tiledMoveRight = 4

local function TiledMoveCallback( pressed, key, isrepeat, nodefunc )
	if pressed then 
		nodefunc.tiledMoveRight = true;
	end
end

function TiledMoveInputSystem:addNode( node )
	nodefunc = {}
	nodefunc.node = node
	nodefunc.func = TiledMoveCallback
	self.keyCallBackSystem:addNode( nodefunc )
	table.insert( self.targets, nodefunc )
end

function TiledMoveInputSystem:update( dt )
	rightIsDown = love.keyboard.isDown("right")
	for i, nodefunc in ipairs(self.targets) do
		node = nodefunc.node
		if nodefunc.tiledMoveRight then
			if rightIsDown then
				node.position.x = node.position.x + 500 * dt
			else
				destination = node.position.x - node.position.x % self.moveWidth + self.moveWidth
				node.position.x = math.min( destination, 
									node.position.x + 500 * dt )
			    if node.position.x == destination then
					nodefunc.tiledMoveRight = false
				end
			end
		end
	end
end

return TiledMoveInputSystem