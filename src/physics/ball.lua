local class = require"libs.middleclass"
local functions = require"functions"
local lume = require"libs.lume"

local ball = {
  {"component", "ball", {
    name = "ball1",
    x = 10,
    y = 300,
    size = 20,
    restitution = 0,
    gravity = 0.8,
    density = 1,
    mass = 1,
    physics_type = "dynamic",
    gamestate = "physics_test",
    draw_mode = "line",
    collision_category = 0000000000000001,
    collision_mask = 0000000000000001,
    collision_group = 2,
    friction = 1,
    camera_name = "camera1"}},


  {"love update", "update body position", {function(e)
    e.x = e.body:getX()
    e.y = e.body:getY()

  end}},

  {"love load", "load ball", {function(e)
    e.body = love.physics.newBody(references.world, e.x, e.y, e.physics_type) 
    e.shape = love.physics.newCircleShape(e.size) 
    e.fixture = love.physics.newFixture(e.body, e.shape, e.density) 
    e.fixture:setRestitution(e.restitution)
    e.fixture:setFriction(e.friction)
    e.body:setGravityScale(e.gravity)
    e.fixture:setUserData(e.name)
    e.fixture:setSensor(e.is_sensor)
    e.fixture:setFilterData(e.collision_category, e.collision_mask, e.collision_group)
    e.body:setMass(e.mass)
  end}},


  {"love draw", "draw ball", {function(e)
    references.entities[e.camera_name]:attach()
        lg.circle(e.draw_mode, e.body:getX(), e.body:getY(), e.shape:getRadius())
    references.entities[e.camera_name]:detach()
  end}},

}
  
return ball