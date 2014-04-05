local class = require 'lib/middleclass'

local IH = require 'lib/imagehelper'
local PositionComponent = require 'lib/PositionComponent'

Background = class('Background')

function Background:initialize(img, x, y, name)
	self.canvas = IH.createImageCanvas_Fit(img, x, y );
	self.position = PositionComponent:new()
	self.name = name or "Background"
end

return Background