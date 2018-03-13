local enemy = {
	{"component", "enemy components", 
		{		
		name = "enemy",
		rotation_speed = 8,
		speed = 180,
		is_sensor = false,
		collision_category = 0000000000000010,
    	collision_mask = 0000000000000010,
    	collision_group = 0,
    	debug = false
		},

	},

	{"love update", "move enemy linearly",
		{function(e)
			e.timer:update(references.delta_time)
			e.body:setLinearVelocity(e.linear_velocity.x, e.linear_velocity.y)
		end}
	},
	{"love update", "keep enemy inside boundaries", 
		{function(e)
			if references.a_begin_contact == e.fixture and
				references.b_begin_contact == "limit" then

			end
		end}
	},
	{"love update", "kill tallix ball when collided", {function(e)
		if references.super_ball_is_active == false then
			for i = 1, #e.body:getContactList() do
				local fixture_1, fixture_2 = e.body:getContactList()[i]:getFixtures()
				if fixture_1:getUserData() == "tallix ball" or fixture_2:getUserData() == "tallix ball"  then
					references.kill_ball = e.body:getContactList()[i]:isTouching()
				end
			end
		end
	end}}


}

return enemy