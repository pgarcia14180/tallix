local class = require"libs.middleclass"
local functions = require"functions"
local lume = require"libs.lume" 

local Class = {}
Class.generic = class("Class")
Class.generic.entity = {
	drawable = true,
	input_active = true,
	update_active = true,
	load = {},
	update = {},
	draw = {},
	keypressed = {},
	keyreleased = {},
	mousepressed = {},
	mousereleased = {},
	textinput = {},
	camera = {},
	gamestate = "all",
	_load = function(e)
		for i = 1, #e.load do
			e.load[i](e)
		end
	end,
	_update = function(e, dt)
		for i = 1, #e.update do
			e.update[i](e, dt)
		end
	end,
	_draw = function(e)
		for i = 1, #e.draw do
			e.draw[i](e)
		end
	end,
	_keypressed = function(e, key, scancode, isrepeat)
		for i = 1, #e.keypressed do
			e.keypressed[i](e, key, scancode, isrepeat)
		end
	end,
	_keyreleased = function(e, key, scancode, isrepeat)
		for i = 1, #e.keyreleased do
			e.keyreleased[i](e, key, scancode, isrepeat)
		end
	end,
	_mousepressed = function(e, x, y, button)
		for i = 1, #e.mousepressed do
			e.mousepressed[i](e, x, y, button)
		end
	end,
	_mousereleased = function(e, x, y, button)
		for i = 1, #e.mousereleased do
			e.mousereleased[i](e, x, y, button)
		end
	end,
	_textinput = function(e, t)
		for i = 1, #e.texinput do
			e.textinput[i](e, t)
		end
	end,
}

return Class