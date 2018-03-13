math.randomseed( os.time() )
-- for the z index I'll add more drawing systems with filters and for the column I'll make a kind of drawable == true, or maybe in the filters I'll add another filter
references = require"references"
lg = love.graphics
lk = love.keyboard
le = love.event
lm = love.mouse
lp = love.physics


local systems = require"systems"


love.window.setMode( 800, 600, {resizable=true})


------------


------------
gs = "main_menu"

function love.load()
	systems.load()
end

function love.update(dt)
	references.delta_time = dt
	systems.update(dt)
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end

function love.mousepressed( x, y, button, istouch )
	systems.mousepressed(x, y, button)
end

function love.mousereleased( x, y, button, istouch )
	systems.mousereleased(x, y, button)
end

function love.keypressed( key, scancode, isrepeat )
	systems.keypressed( key, scancode, isrepeat )
end

function love.keyreleased( key, scancode, isrepeat )
	systems.keyreleased( key, scancode, isrepeat )
end

function love.textinput(t)
	--systems.textinput(t)
end

function love.draw()
	systems.draw_plus_1()
	systems.draw_plus_2()
  	systems.draw()
  	systems.draw_minus_1()
  	systems.draw_minus_2()
end 
 
