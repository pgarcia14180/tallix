local Timer = require 'libs.Timer'


local wanderer = {
    {"component", "wanderer components",
        {
		tween_duration = 4,
		starting_interval = 3,
		ending_interval = 8,
		linear_velocity = {x = 0, y = 0},
		directions = {},
    	seed = 9,
		direction = 5,
		time_to_change_direction = 3,
		ease = "linear",
        
        }
    },

	{"love load", "load wanderer",
		{function(e)
    		e.randomness = love.math.newRandomGenerator()
			e.timer = Timer()
			e.directions = {{-e.speed, 0}, {-e.speed, -e.speed}, {0, -e.speed}, {e.speed, -e.speed}, {e.speed, 0}, {e.speed, e.speed}, {e.speed, 0}, {-e.speed, e.speed}}
			e.randomness:setSeed(os.time()+e.seed)
			e.timer:every({e.randomness:random(2, 3), e.randomness:random(5, 9)}, function() e.direction = e.randomness:random(1, 8) e.timer:tween(e.tween_duration, e.linear_velocity, {x = e.directions[e.direction][1], y = e.directions[e.direction][2]}, e.ease) end)
		end}
    },
    
	{"love draw", "debug enemy", 
		{function(e)
			if e.debug then
				lg.print(e.directions[e.direction][1])
				lg.print(e.direction, 0, 20)
				lg.print(tostring(e.randomness), 0, e.seed)
			end
		end}
	},


}

return wanderer