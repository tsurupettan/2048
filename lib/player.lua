local class = require 'lib/middleclass'

Player = class('Player')

function Player:initialize(canvas, x, y)
	self.canvas = canvas
	self.x = x or 0
	self.y = y or 0
end

Player.static.speed = 500

function Player:update(dt)
	if love.keyboard.isDown("down") then
		self.y = self.y + (dt * 500)
	end
	if love.keyboard.isDown("up") then
		self.y = self.y - (dt * 500)
	end
	if love.keyboard.isDown("right") then
		self.x = self.x + (dt * 500)
	end
	if love.keyboard.isDown("left") then
		self.x = self.x - (dt * 500)
	end
end

return Player