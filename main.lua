class = require '30log'

function createImageCanvas_Fit( img_path, width, height )
	image = love.graphics.newImage( img_path )

	canvas = love.graphics.newCanvas( width, height)
	love.graphics.setCanvas(canvas)
		canvas:clear()
		love.graphics.setBlendMode('alpha')
		love.graphics.draw(image, 0, 0, 0,
						   width/image:getWidth(),
						   height/image:getHeight()
						  )
	love.graphics.setCanvas()
	return canvas
end


pikachu_x = 0
pikachu_y = 0

function love.load()
	win_width, win_height = love.graphics.getDimensions( )

	background = createImageCanvas_Fit("background.jpg", win_width, win_height)
	pikachu = createImageCanvas_Fit("pikachu.png", 100, 100)
end

function love.draw()
    -- love.graphics.setColor(255, 255, 255, 255)
	
    -- Draw background
    love.graphics.setBlendMode('premultiplied')
    love.graphics.draw(background)

    --Draw Pikachu
    love.graphics.draw(pikachu, pikachu_x, pikachu_y)
end

rate = 500
function love.update(dt)
	if love.keyboard.isDown("down") then
		pikachu_y = pikachu_y + (dt * rate)
	end
	if love.keyboard.isDown("up") then
		pikachu_y = pikachu_y - (dt * rate)
	end
	if love.keyboard.isDown("right") then
		pikachu_x = pikachu_x + (dt * rate)
	end
	if love.keyboard.isDown("left") then
		pikachu_x = pikachu_x - (dt * rate)
	end
end

