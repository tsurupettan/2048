
function love.load()

	win_width, win_height = love.graphics.getDimensions( )

	bg_image = love.graphics.newImage("background.jpg")
	bg_width = bg_image:getWidth()
	bg_height = bg_image:getHeight()

	background = love.graphics.newCanvas(bg_width, bg_height)
	love.graphics.setCanvas(background)
		background:clear()
		love.graphics.setBlendMode('alpha')
		love.graphics.draw(bg_image)
	love.graphics.setCanvas()
end

function love.draw()
    love.graphics.setColor(255, 255, 255, 255)
	
    -- Draw background
    love.graphics.setBlendMode('premultiplied')
    love.graphics.draw(background, 0, 0, 0, win_width/bg_width, win_height/bg_height)
end
