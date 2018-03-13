local tallix_limit = {
	{"component", "tallix limit", 
		{
		name = "tallix limit",
	    x = 0,
	    y = 0,
	    size = 80,
	    restitution = 0,
	    gravity = 0.7,
	    density = 1,
	    drawable = true,
	    mass = 1,
	    physics_type = "kinematic",
	    gamestate = "tallix_test",
	    draw_mode = "fill",
	    friction = 1,
	    camera_name = "camera1",
	    collision_category = 0000000000000010,
	    collision_mask = 0000000000000010,
	    collision_group = 2,
	    is_sensor = false,
	    state = "none",
	    is_colliding = false,
	    limit_type = "none",
	    is_active = true


		}
	},

	{"love update", "check if fixture is colliding with tallix ball", 
        {function(e)
             for i = 1, #e.body:getContactList() do
                local fixture_1, fixture_2 = e.body:getContactList()[i]:getFixtures()
                if fixture_1:getUserData() == "tallix ball" or fixture_2:getUserData() == "tallix ball"  then
            		e.is_colliding = e.body:getContactList()[i]:isTouching()
        		end
        	end
        end}
    },
	
	{"love update", "activate gravity change", 
        {function(e) 
            if e.limit_type == "gravity down" and e.is_colliding and e.is_active then
            	references.gravity = "down"
            	e.is_colliding = false
            elseif e.limit_type == "gravity up" and e.is_colliding and e.is_active then
            	references.gravity = "up"
            	e.is_colliding = false
            end
        end}
    },

	{"love draw", "tallix limit debug draw", 
        {function(e) 
            	--lg.print(tostring(cl))
        end}
    },




}

return tallix_limit