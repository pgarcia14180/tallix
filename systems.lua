local suit = require"libs.suit"
local system = require"libs.system"
local entities = require"entities"

---------------
---------------
local sharedSystems = {}

sharedSystems.setGameState = system(
{"-gamestate", "_entity"},
function(e)
	for i = 1, #e.gamestate do
		if e.gamestate[i] == gs or e.gamestate[i] == "all" or e.gamestate == "all" or e.gamestate == gs then
			e.currentState = true
		elseif e.gamestate ~= gs then
			e.currentState = false
		end
	end
end)

sharedSystems.startingGamestate = system(
{"-startingGamestate", "_entity"},
function(e)
	e._load()
end)

sharedSystems.load = system(
{"-_load", "_entity", "-currentState"},
function(e)
	e._load(e)
end)

sharedSystems.update = system(
{"-_update", "_entity", "-currentState", "-update_active"},
function(e, dt)
	e._update(e, dt)
end)

sharedSystems.mousepressed = system(
{"-_mousepressed", "_entity", "-currentState", "-input_active"},
function(e, x, y, button)
	e._mousepressed(e, x, y, button)
end)

sharedSystems.mousereleased = system(
{"-_mousereleased", "_entity", "-currentState", "-input_active"},
function(e, x, y, button)
	e._mousereleased(e, x, y, button)
end)

sharedSystems.keypressed = system(
{"-_keypressed", "_entity", "-currentState", "-input_active"},
function(e, key, scancode, isrepeat)
	e._keypressed(e, key, scancode, isrepeat)
end)

sharedSystems.textinput = system(
{"_keypressed", "_entity", "-currentState", "-input_active"},
function(e, t)
	e._textinput(e, t)
end)

sharedSystems.keyreleased = system(
{"-_keyreleased", "_entity", "-currentState", "-input_active"},
function(e, key, scancode, isrepeat)
	e._keyreleased(e, key, scancode, isrepeat)
end)


sharedSystems.draw = system(
{"-_draw", "-drawable", "_entity", "-currentState", "!draw_plus_1", "!draw_plus_2", "!draw_minus_1", "!draw_minus_2"},
function(e, key, scancode, isrepeat)
	e._draw(e)
end)

sharedSystems.draw_plus_1 = system(
{"-_draw", "-drawable", "_entity", "-currentState", "-draw_plus_1"},
function(e, key, scancode, isrepeat)
	e._draw(e)
end)

sharedSystems.draw_plus_2 = system(
{"-_draw", "-drawable", "_entity", "-currentState", "-draw_plus_2"},
function(e, key, scancode, isrepeat)
	e._draw(e)
end)

sharedSystems.draw_minus_1 = system(
{"-_draw", "-drawable", "_entity", "-currentState", "-draw_minus_1"},
function(e, key, scancode, isrepeat)
	e._draw(e)
end)

sharedSystems.draw_minus_2 = system(
{"-_draw", "-drawable", "_entity", "-currentState", "-draw_minus_2"},
function(e, key, scancode, isrepeat)
	e._draw(e)
end)
---------------
---------------


local systems = {}

function systems.load()
	for _, entity in ipairs(entities) do
		sharedSystems.setGameState(entity)
	end
	for _, entity in ipairs(entities) do
		sharedSystems.load(entity)
	end
end

function systems.mousepressed(x, y, button)
	for _, entity in ipairs(entities) do
		sharedSystems.mousepressed(entity, x, y, button)
	end
end

function systems.mousereleased(x, y, button)
	for _, entity in ipairs(entities) do
		sharedSystems.mousereleased(entity, x, y, button)

	end
end

function systems.keypressed( key, scancode, isrepeat )
	suit.keypressed(key)
	for _, entity in ipairs(entities) do
		sharedSystems.keypressed(entity, key, scancode, isrepeat )

	end
end

function systems.keyreleased( key, scancode, isrepeat )
	for _, entity in ipairs(entities) do
		sharedSystems.keyreleased(entity, key, scancode, isrepeat )

	end
end 

function systems.textinput(t)
  for _, entity in ipairs(entities) do
    sharedSystems.textinput(entity, t)
  end
end


function systems.update(dt)
	for _, entity in ipairs(entities) do
		sharedSystems.update(entity, dt)

	end
end
	

function systems.draw()
	for _, entity in ipairs(entities) do
		sharedSystems.draw(entity)
	end
end
function systems.draw_plus_1()
	for _, entity in ipairs(entities) do
		sharedSystems.draw_plus_1(entity)
	end
end 
function systems.draw_plus_2()
	for _, entity in ipairs(entities) do
		sharedSystems.draw_plus_2(entity)
	end
end 
function systems.draw_minus_1()
	for _, entity in ipairs(entities) do
		sharedSystems.draw_minus_1(entity)
	end
end 
function systems.draw_minus_2()
	for _, entity in ipairs(entities) do
		sharedSystems.draw_minus_2(entity)
	end
end 

return systems