local block = {
  {"component", "block", {
    name = "block",
    gamestate = "physics_test",
    x = 300,
    y = 500, 
    width = 500000,
    height = 20,
    angle = 0,
    angular_velocity = 0,
    physicsType = "kinematic",
    draw_mode = "fill",
    camera_name = "camera1",
    set_x_linear_velocity = 0,
    set_y_linear_velocity = 0,
    get_x_linear_velocity = 0,
    get_y_linear_velocity = 0,
    x_distance = 1000,
    y_distance = 1000,
    x_waiting_time = 2,
    y_waiting_time = 2,
    x_timer = 0,
    y_timer = 0,
    x_state = "going",
    y_state = "going",
    }},



    {"love load", "load block", {function(e)
        e.body = love.physics.newBody(references.world, e.x, e.y, e.physicsType)
        e.shape = love.physics.newRectangleShape(e.width, e.height)
        e.fixture = love.physics.newFixture(e.body, e.shape)
        e.fixture:setUserData(tostring(e.name))
        e.body:setAngle(math.rad(e.angle))
    end}},

  {"love update", "rotate block", {function(e)
    e.body:setAngularVelocity(e.angular_velocity)
  end}},

  {"love load", "reference block velocity", {function(e)
        if references.platforms == nil then
            references.platforms = {}
        end
        references.platforms[e.name] = {}
        references.platforms[e.name]["x"], references.platforms[e.name]["y"] = e.body:getLinearVelocity()

  end}},

  {"love update", "reference block velocity", {function(e)
        if references.platforms == nil then
            references.platforms = {}
        end
        references.platforms[e.name] = {}
        references.platforms[e.name]["x"], references.platforms[e.name]["y"] = e.body:getLinearVelocity()

  end}},

  {"love update", "body x movement", {function(e, dt)
    e.get_x_linear_velocity, e.get_y_linear_velocity = e.body:getLinearVelocity()
    if e.body:getX() > e.x+e.x_distance and e.x_state == "going" then
        e.x_state = "stop_1"
    elseif e.x_state == "stop_1" then
        e.x_timer = e.x_timer + dt
    end
    if e.x_timer > e.x_waiting_time and e.x_state == "stop_1" then
        e.x_timer = 0
        e.x_state = "returning"
    elseif e.body:getX() < e.x and e.x_state == "returning" then
        e.x_state = "stop_2"
    elseif e.x_state == "stop_2" then
        e.x_timer = e.x_timer + dt
    end
    if e.x_timer > e.x_waiting_time and e.x_state == "stop_2" then
        e.x_timer = 0
        e.x_state = "going"
    end
        
       
    if e.x_state == "going" then
        e.body:setLinearVelocity(e.set_x_linear_velocity, e.get_y_linear_velocity)
    elseif e.x_state == "stop_1" then
        e.body:setLinearVelocity(0, 0)
    elseif e.x_state == "stop_2" then
        e.body:setLinearVelocity(0, 0)
    elseif e.x_state == "returning" then
        e.body:setLinearVelocity(-e.set_x_linear_velocity, e.get_y_linear_velocity)
    end
    


  end}},

  {"love update", "body y movement", {function(e, dt)
    e.get_x_linear_velocity, e.get_y_linear_velocity = e.body:getLinearVelocity()
        
    if e.body:getY() > e.y+e.y_distance and e.y_state == "going" then
        e.y_state = "stop_1"
    elseif e.y_state == "stop_1" then
        e.y_timer = e.y_timer + dt
    end
    if e.y_timer > e.y_waiting_time and e.y_state == "stop_1" then
        e.y_timer = 0
        e.y_state = "returning"
    elseif e.body:getY() < e.y and e.y_state == "returning" then
        e.y_state = "stop_2"
    elseif e.y_state == "stop_2" then
        e.y_timer = e.y_timer + dt
    end
    if e.y_timer > e.y_waiting_time and e.y_state == "stop_2" then
        e.y_timer = 0
        e.y_state = "going"
    end    

    if e.y_state == "going" then
        e.body:setLinearVelocity(e.get_x_linear_velocity, e.set_y_linear_velocity)
    elseif e.y_state == "stop_1" then
        e.body:setLinearVelocity(0, 0)
    elseif e.y_state == "stop_2" then
        e.body:setLinearVelocity(0, 0)
    elseif e.y_state == "returning" then
        e.body:setLinearVelocity(e.get_x_linear_velocity, -e.set_y_linear_velocity)
    end


  end}},

  {"love draw", "draw block", {function(e)
    references.entities[e.camera_name]:attach()
      love.graphics.polygon(e.draw_mode, e.body:getWorldPoints(e.shape:getPoints()))
    references.entities[e.camera_name]:detach()
    lg.print(e.x_state, 0, 30)
  end}}
}

return block