local world = {
  {"component", "create world", {
    meter = 64,
    gravity = 9.81,
    horizontal_gravity = 0,
    vertical_gravity = 9.81,
    sleep = false,
    world = "nil",
    gamestate = "physics_test"
  }},
  {"love load", "load world", {function(e)
    lp.setMeter(e.meter)
    e.world = lp.newWorld(e.horizontal_gravity, e.vertical_gravity*e.meter, e.sleep)
    references.world = e.world
    references.gravity_direction = "down"
  end}},
  {"love load", "set collision callbacks", {function(e)
    references.world:setCallbacks(e.begin_contact, e.end_contact)
  end}},
  {"component", "collision components", {
    begin_contact = function(a, b, c)
      references.a_begin_contact = a
      references.b_begin_contact = b
    end,
    end_contact = function(a, b, c)
      references.a_end_contact = a
      references.b_end_contact = b
    end
  }},

  {"love update", "reference world", {function(e, dt)
    references.world = e.world
  end}},
  {"love update", "reference contact list", 
    {function(e)
      references.contact_list = e.world:getContactList()
    end}
  },
  {"love update", "update world", {function(e, dt)
    references.world:update(references.delta_time)
  end}},    
   {"love update", "change world gravity", 
        {function(e)
            if references.gravity == "down" then
                e.world:setGravity(0, e.gravity*e.meter)
                e.gravity_direction = "down"
            elseif references.gravity == "left" then
                e.world:setGravity( -(e.gravity*e.meter), 0)
                e.gravity_direction = "left"
            elseif references.gravity == "up" then
                e.world:setGravity(0, -(e.gravity*e.meter))
                e.gravity_direction = "up"
            elseif references.gravity == "right" then
                e.world:setGravity((e.gravity*e.meter), 0)
                e.gravity_direction = "right"
            end
            
        end}
    },
  {"love draw", "test contact", {function(e)
    for i = 1, #e.world:getContactList() do
      lg.print(tostring(e.world:getContactList()[i]:getFixtures():getUserData()), 50, 50*i)
    end
  end}},
}

return world