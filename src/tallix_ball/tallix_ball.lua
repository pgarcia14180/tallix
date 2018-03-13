local class = require"libs.middleclass"
local functions = require"functions"
local lume = require"libs.lume"

local tallix_ball = {
  {"component", "tallix ball", {
    name = "tallix ball",
    x = references.ball_start_x,
    y = references.ball_start_y,
    linear_velocity_x,
    linear_velocity_y,
    size = 17,
    is_moving = false,
    moving_range = 5,
    restitution = 0,
    gravity = 0.5,
    density = 1,
    mass = 1,
    physics_type = "dynamic",
    gravity_direction = "down",
    gamestate = "tallix_test",
    draw_mode = "fill",
    friction = 1,
    camera_name = "camera1",
    collision_category = 0000000000000001,
    collision_mask = 0000000000000001,
    collision_group = 2,
    inactive_timer = 0,
    inactive_limit = 0.5,
    super_velocity = 2,
    debug = false

    }},




    {"love update", "super ball", 
        {function(e)
            if references.combo_count > references.combo_start then
                e.body:setGravityScale(e.gravity*e.super_velocity)
                references.super_ball_is_active = true
            else
                references.super_ball_is_active = false
                e.body:setGravityScale(e.gravity)
            end
        end}
    },

    {"love update", "get physics object velocity", 
        {function(e)
            e.linear_velocity_x, e.linear_velocity_y = e.body:getLinearVelocity()
        end}
    },

    {"love update", "check if tallix ball is moving", 
        {function(e)
            if e.linear_velocity_y > e.moving_range or e.linear_velocity_y < -e.moving_range then
                e.is_moving = true
            else
                e.is_moving = false
            end
        end}
    },

    {"love update", "counts ball's inactivity", 
        {function(e)
            if e.is_moving == false then
                e.inactive_timer = e.inactive_timer + references.delta_time
            else
                e.inactive_timer = 0
            end
        end}
    },

    {"love update", "check if tallix ball is active", 
        {function(e) 
            if e.inactive_timer > e.inactive_limit then
                references.ball_is_active = false
            else
                references.ball_is_active = true
            end
        end}
    },



    {"love draw", "debug ball", 
        {function(e)
            if e.debug then
                lg.print(tostring(e.body), 500)
            end
        end}
    },    


}
  
return tallix_ball