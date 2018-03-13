local tallix = 
{
    {"component", "tallix", {
        name = "tallix1",
        x = 100,
        y = 300,
        angle_random = true,
        physics_type = "kinematic",
        gamestate = "tallix_test",
        draw_mode = "fill",
        drawable = true,
        tallix_type =0,
        tallix_mouse_sensor_size = 50,
        drawable_window = 1200,
        camera_name = "camera1",
        angles = {1.570799946785, 3.1415901184082, 4.7123899459839, 6.283197735596, 7.85398},
        command = "idle",
        rotates_to = "idle",
        rotation_velocity = 8,
        collision_category = 0000000000000000,
        collision_mask = 0000000000000000,
        collision_group = 2,
        is_being_hovered = false,
        images = {love.graphics.newImage("assets/l.png"), love.graphics.newImage("assets/x.png"), love.graphics.newImage("assets/t.png"), love.graphics.newImage("assets/a.png"),love.graphics.newImage("assets/i.png") }

        }
    },

    {"component", "tallix shapes", 
        {
            shapes = {   
                {
                    {14.9961,   12.9922 ,
                    68.4961,   -40.5039 ,
                    79.9883,   -12.0078 ,
                    78.9883,   17.5391 ,
                    68.9628,   42.0183 ,
                    46.0586,   66.7461 , 14.9961,   12.9922 },
                    {                14.9961,   12.9883 ,
                    -40.5273,   69.543 ,
                    -16.8735,   79.0396 ,
                    12.9961,   79.9961 ,
                    38.9526,   70.9526 ,
                    46.0508,   66.75 , 14.9961,   12.9883  },
                    {           -17,   -11.0117 ,
                    41,   -69.0156 ,
                    10.9961,   -80.0023 ,
                    -11.8706,   -79.9634 ,
                    -36.9961,   -72.0117 ,
                    -59,   -55.0156 ,
                    -73.9883,   -32.0234 ,  -17,   -11.0117 },
                    {                 -17.0039,   -11.0234 ,
                    -69.415,   40.3811 ,
                    -79.9922,   12.9805 ,
                    -78.915,   -17.9856 ,
                    -74,   -32 , -17.0039,   -11.0234 
                    },
                },
                {
                    { 
                    0.0234375,   -28.5547 ,
                    40.3633,   -69.0391 ,
                    26.2383,   -76.4141 ,
                    8.86328,   -80.1641 ,
                    -11.6367,   -79.5391 ,
                    -29.0117,   -74.7891 ,
                    -40.9562,   -69.1613 ,
                    0.0234375,   -28.5547  },
                    {28.3438,   0 ,
                    68.9177,   -40.9168 ,
                    77.848,   -18.4482 ,
                    79.8594,   5.83594 ,
                    75.2344,   27.4609 ,
                    68.5,   40.4219 , 28.3438,   0 },
                    {-28.9414,   -0.03125 ,
                    -69.082,   39.9531 ,
                    -76.6445,   24.8281 ,
                    -79.8945,   10.3281 ,
                    -79.6065,   -12.9382 ,
                    -74.8945,   -30.4844 ,
                    -69.3891,   -41.0686 , -28.9414,   -0.03125},
                    { 0.00390625,   28.1211 ,
                    40.168,   68.5508 ,
                    20.8283,   77.0657 ,
                    5.13264,   79.5875 ,
                    -12.2152,   79.2831 ,
                    -30.563,   74.1092 ,
                    -41.0039,   68.957 ,
                    0.00390625,   28.1211 
                    }
                },
                {
                    { 
                    28.3399,   -1.51562 ,
                    68.9138,   -42.4324 ,
                    77.8441,   -19.9638 ,
                    79.8555,   4.32032 ,
                    75.7305,   25.8203 ,
                    68.4961,   38.9063 , 28.3399,   -1.51562 
                    },
                    { 
                    0.0234375,   -28.5547 ,
                    40.3633,   -69.0391 ,
                    26.2383,   -76.4141 ,
                    8.86328,   -80.1641 ,
                    -11.6367,   -79.5391 ,
                    -29.0117,   -74.7891 ,
                    -40.9562,   -69.1613 ,
                    0.0234375,   -28.5547    },
                    { 
                    40.3615,   68.4961 ,
                    19.1615,   78.2405 ,
                    -16.2148,   79.5586 ,
                    -43.6637,   68.1325 ,
                    -66.5273,   44.8597 ,
                    -76.4023,   25.0586 ,
                    -15.543,   12.5039, 40.3615,   68.4961 },
                    { 
                    -68.5977,   -40.4805 ,
                    -73.6602,   -32.5117 ,
                    -79.5352,   -13.2617 ,
                    -80.4102,   6.36328 ,
                    -76.4685,   25.0438 ,
                    -15.5273,   12.4805, -68.5977,   -40.4805   
                    },
                },
                {
                    {   
                    28.4531,   0.195312 ,
                    69.4531,   -40.5547 ,
                    78.8906,   -17.8672 ,
                    78.9601,   17.3745 ,
                    69.6974,   40.5078 ,
                    28.4531,   0.195312 
                    },
                    { 
                    -28.234,   0.602751 ,
                    40.9861,   -68.7057 ,
                    16.0078,   -78.9883 ,
                    -13.674,   -78.9428 ,
                    -40.4013,   -69.8519 ,
                    -59.1286,   -54.2156 ,
                    -70.4922,   -38.4883 ,
                    -28.234,   0.602751  },
                    {    40.8242,   68.9414 ,
                    -69.3198,   -39.9146 ,
                    -80.4883,   -6.49609 ,
                    -75.4883,   30.5039 ,
                    -53.1549,   60.5039 ,
                    -22.1853,   77.9888 ,
                    13.3299,   80.3827 ,
                    40.8242,   68.9414
                    },
                },
                {
                    {   
                    28.4531,   0.195312 ,
                    69.4531,   -40.5547 ,
                    78.8906,   -17.8672 ,
                    78.9601,   17.3745 ,
                    69.6974,   40.5078 ,
                    28.4531,   0.195312 
                    },
                    {-28.234,   0.602751 ,
                    40.9861,   -68.7057 ,
                    16.0078,   -78.9883 ,
                    -13.674,   -78.9428 ,
                    -40.4013,   -69.8519 ,
                    -59.1286,   -54.2156 ,
                    -70.4922,   -38.4883 ,
                    -28.234,   0.602751},
                    {  40.8242,   68.9414 ,
                    -69.3198,   -39.9146 ,
                    -80.4883,   -6.49609 ,
                    -75.4883,   30.5039 ,
                    -53.1549,   60.5039 ,
                    -22.1853,   77.9888 ,
                    13.3299,   80.3827 ,
                    40.8242,   68.9414},
                    {     28.4375,   0.199219 ,
                    0.0976562,   -27.957 ,
                    41.1411,   -68.7152 ,
                    59.0977,   -55.3529 ,
                    69.4375,   -40.5625 ,
                    28.4375,   0.199219 
                    }
                }
            }
        }
    },


    {"love load", "load tallix", {function(e)
        if e.tallix_type == 0 then 
            e.tallix_type = math.random(1,5)
        end
        e.body = love.physics.newBody(references.world, e.x, e.y, e.physics_type) 
        if e.status == "start" then
            e.body:setAngle(e.angles[math.random(1,2)])
        elseif e.angle_random then
            e.body:setAngle(e.angles[math.random(1,4)])
        end
        e.shape = {}
        e.fixture = {}
        if e.tallix_type == 4 then
            for i = 1, 3 do
                e.shape[i] = love.physics.newPolygonShape(e.shapes[e.tallix_type][i])
                e.fixture[i] = love.physics.newFixture(e.body, e.shape[i])
                e.fixture[i]:setUserData(e.name)
                e.fixture[i]:setFilterData(e.collision_category, e.collision_mask, e.collision_group)
            end
        else
            for i = 1, 4 do
                e.shape[i] = love.physics.newPolygonShape(e.shapes[e.tallix_type][i])
                e.fixture[i] = love.physics.newFixture(e.body, e.shape[i])
                e.fixture[i]:setUserData(e.name)
                e.fixture[i]:setFilterData(e.collision_category, e.collision_mask, e.collision_group)
            end
        end
        end}
    },
    {"love update", "make entity drawable",
        {function(e)
            if e.body:getX() > references.entities[e.camera_name].x-(e.drawable_window*1.3) and e.body:getX() < references.entities[e.camera_name].x + (e.drawable_window*1.3) and e.body:getY() > references.entities[e.camera_name].y-e.drawable_window and e.body:getY() < references.entities[e.camera_name].y + e.drawable_window then
                e.drawable = true
            else
                e.drawable = false
            end
        end} 

    },
    {"love draw", "draw tallix", 
        {function(e)
            references.entities[e.camera_name]:attach()
            if e.status == "none" or e.status == "start" then
                if e.tallix_type == 4 then
                    for i = 1, 3 do
                        love.graphics.setColor(0,139,139)
                        love.graphics.polygon( e.draw_mode,e.body:getWorldPoints(e.shape[i]:getPoints())) 
                    end
                else
                    for i = 1, 4 do
                        love.graphics.setColor(0,139,139)
                        love.graphics.polygon( e.draw_mode,e.body:getWorldPoints(e.shape[i]:getPoints())) 
                    end

                end
            end
            references.entities[e.camera_name]:detach()


        end
        }
    },
    {"love draw", "draw tallix images", 
        {function(e)
            references.entities[e.camera_name]:attach()
                love.graphics.draw(e.images[e.tallix_type], e.body:getX(), e.body:getY(), e.body:getAngle(),1,1,90,90 )

            references.entities[e.camera_name]:detach()
        end}
    },


    {"love update", "check if mouse is hovering tallix",
        {function(e)
                if references.entities[e.camera_name].mx > e.x-e.tallix_mouse_sensor_size and references.entities[e.camera_name].mx < e.x+e.tallix_mouse_sensor_size and references.entities[e.camera_name].my > e.y-e.tallix_mouse_sensor_size and references.entities[e.camera_name].my < e.y+e.tallix_mouse_sensor_size then
                    e.is_being_hovered = true
                else
                    e.is_being_hovered = false
                end
        end}
    },
    {"love update", "rotate tallix", 
        {function(e)
            if e.can_rotate then
                for i = 1, 5 do
                    if e.body:getAngle() <= e.angles[i] + 0.00001 and  e.body:getAngle() >= e.angles[i] - 0.00001 and e.command == "right" then
                        e.body:setAngularVelocity(e.rotation_velocity)
                        if i == 5 then
                            e.rotates_to = 1
                        else
                            e.rotates_to = i+1
                        end 
                    end
                    if e.body:getAngle() <= e.angles[i] + 0.00001 and  e.body:getAngle() >= e.angles[i] - 0.00001 and e.command == "left" then
                        e.body:setAngularVelocity(-e.rotation_velocity)
                        if i == 1 then
                            e.rotates_to = 5
                        else
                            e.rotates_to = i-1
                        end 
                    end
                end
            end
        end}
    },
    {"love update", "stop tallix rotation", 
        {function(e)
            if e.command == "right" then 
                for i = 1, 5 do
                    if e.rotates_to == i and e.body:getAngle() >= e.angles[i]+0.00001 then
                        e.body:setAngularVelocity(0)
                        e.body:setAngle(e.angles[e.rotates_to])
                        e.command = "idle"
                        e.rotates_to = "idle"
                    end
                end
            end
            if e.command == "left" then 
                for i = 1, 5 do
                    if e.rotates_to == i and e.body:getAngle() <= e.angles[i]-0.00001 then
                        e.body:setAngularVelocity(0)
                        e.body:setAngle(e.angles[e.rotates_to])
                        e.command = "idle"
                        e.rotates_to = "idle"
                    end
                end

            end
        end}
    },
    {"love update", "control each tallix",
        {function(e)
            if e.is_being_hovered then
                if love.mouse.isDown(1)  then
                    e.command = "left"
                elseif love.mouse.isDown(2) then
                    e.command = "right"
                end
            end
        end}

    },
    {"love update", "control all tallix",
        {function(e)
            if love.mouse.isDown(1)  then
                e.command = "left"
            elseif love.mouse.isDown(2) then
                e.command = "right"
            end
        end}

    },


    {"love draw", "print mouse position", {function(e) 
        --lg.print(tostring(references.entities[e.camera].mx).." "..tostring(references.entities[e.camera].my)), 40, 30) 
        lg.print(tostring(love.mouse.getX()).." "..tostring(love.mouse.getY()), 40, 40) 

    end}}
}
return tallix