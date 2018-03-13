local tallix_sensor = {
	{"component", "tallix sensor",
        {
        tallix_sensor_name = "tallix sensor",
        tallix_sensor_size = 5,
        tallix_sensor_collision_category = 0000000000000001,
        tallix_sensor_collision_mask = 0000000000000001,
        tallix_sensor_collision_group = 1,
        tallix_sensor_physics_type = "kinematic",
        combo = false,
        collided_with_super_ball = false,
        collided_with_super_ball_counter = 0,
        collided_with_super_ball_counter_limit = 4,
        }
    },
    {"love load", "load tallix sensor", 
        {function(e)
            e.tallix_sensor_body = love.physics.newBody(references.world, e.x, e.y, e.tallix_sensor_physics_type) 
            e.tallix_sensor_shape = love.physics.newCircleShape(e.tallix_sensor_size) 
            e.tallix_sensor_fixture = love.physics.newFixture(e.tallix_sensor_body, e.tallix_sensor_shape) 
            e.tallix_sensor_fixture:setSensor(true)
            e.tallix_sensor_fixture:setUserData(e.name.."sensor")
            e.tallix_sensor_fixture:setFilterData(e.tallix_sensor_collision_category, e.tallix_sensor_collision_mask, e.tallix_sensor_collision_group)
        end}

    },

    {"love update", "add as comboed ball",
        {function(e)
            if references.ball_is_active and e.combo == false then
                if references.a_begin_contact == e.tallix_sensor_fixture or references.b_begin_contact == e.tallix_sensor_fixture then
                    references.combo_count = references.combo_count + 1
                    e.combo = true
                end
            end
        end}
    },

    {"love update", "reset counter if combo misses",
        {function(e)
            if references.ball_is_active == false then
                references.combo_resetted = true
                references.combo_count = 0
                references.combo_resetted = false
                e.combo = false
            end
        end}
    },

    {"love draw", "draw tallix sensor", 
        {function(e)
            references.entities[e.camera_name]:attach()
            lg.circle(e.draw_mode, e.x, e.y, e.tallix_sensor_shape:getRadius())
            references.entities[e.camera_name]:detach()
        end}
    },

    {"love update", "super ball collided counter", 
        {function(e)
            if e.collided_with_super_ball then
                e.collided_with_super_ball_counter = e.collided_with_super_ball_counter + references.delta_time
            end
        end}
    },   

    {"love update", "reset super ball collided counter", 
        {function(e)
            if e.collided_with_super_ball_counter > e.collided_with_super_ball_counter_limit then
                e.collided_with_super_ball = false
                e.collided_with_super_ball_counter = 0
            end
        end}
    },     

    {"love draw", "sensor test", 
        {function(e)
            --lg.print(tostring(e.body.contact:isTouching()), 0, 0, 0, 2)
        end}
    },

    {"love update", "check if collided with super ball",
        {function(e)
            if references.super_ball_is_active then
                for i = 1, #e.tallix_sensor_body:getContactList() do
                    local fixture_1, fixture_2 = e.tallix_sensor_body:getContactList()[i]:getFixtures()
                    if fixture_1:getUserData() == "tallix ball" or fixture_2:getUserData() == "tallix ball"  then
                        e.collided_with_super_ball = true

                    end
                end
            end
        end}
    },

    {"love draw", "draw super ball effect on tallix", 
        {function(e)

            references.entities[e.camera_name]:attach()
            if e.collided_with_super_ball then
                if e.tallix_type == 1 then
                    love.graphics.setColor(210, 0, 255, 170-e.collided_with_super_ball_counter*60 )
                elseif e.tallix_type == 2  then
                    love.graphics.setColor(231, 0, 127, 170-e.collided_with_super_ball_counter*60)
                elseif e.tallix_type == 3  then
                    love.graphics.setColor(255, 17, 0, 170-e.collided_with_super_ball_counter*60)
                elseif e.tallix_type == 4  then
                    love.graphics.setColor(232, 69, 0, 170-e.collided_with_super_ball_counter*60)
                elseif e.tallix_type == 5  then
                    love.graphics.setColor(255, 137, 8, 170-e.collided_with_super_ball_counter*60)
                end
                if e.tallix_type == 4 then
                    for i = 1, 3 do
                        love.graphics.polygon( e.draw_mode,e.body:getWorldPoints(e.shape[i]:getPoints())) 
                    end
                else
                    for i = 1, 4 do
                        love.graphics.polygon( e.draw_mode,e.body:getWorldPoints(e.shape[i]:getPoints())) 
                    end

                end
            end
            love.graphics.setColor( 255, 205, 205)


            references.entities[e.camera_name]:detach()
        end}
    },

}

return tallix_sensor