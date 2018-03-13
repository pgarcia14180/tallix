local class = require"libs.middleclass"
local functions = require"functions"
local lume = require"libs.lume"

local tallix_status = {
    {"component", "tallix status components", 
        {
        status = "none",
        can_rotate = true,
        key = "",
        debug = false
        }
    },

    {"love update", "tallix status affect", 
        {function(e)
            if e.status == "slow" then
                e.rotation_velocity = 0.8
            else
                e.rotation_velocity = 8
            end
            if e.status == "petrify" then
                e.can_rotate = false
            else
                e.can_rotate = true
            end
            if e.status == "crazy" then
                local number = math.random(1,2)
                if number == 1 then
                    e.rotates_to = "left"
                elseif number == 2 then
                    e.rotates_to = "right"
                end
            end
        end}
    },
    {"love update", "contaminate tallix ball", 
        {function(e)
            for i = 1, #e.tallix_sensor_body:getContactList() do
                local fixture_1, fixture_2 = e.tallix_sensor_body:getContactList()[i]:getFixtures()
                if fixture_1:getUserData() == "tallix ball" or fixture_2:getUserData() == "tallix ball"  then
                    if references.ball_status == nil then
                        references.ball_status = "none"
                    end
                    if e.status == "slow" or e.status == "burn" and e.body:getContactList()[i]:isTouching() then
                        references.ball_status = e.status
                    end
                end
            end
        end}
    },
    {"love update", "get tallix key", 
        {function(e)
            if e.status == "key" then

                    
                for i = 1, #e.tallix_sensor_body:getContactList() do
                    local fixture_1, fixture_2 = e.tallix_sensor_body:getContactList()[i]:getFixtures()
                    if fixture_1:getUserData() == "tallix ball" or fixture_2:getUserData() == "tallix ball"  then
                        if e.tallix_sensor_body:getContactList()[i]:isTouching() then
                            e.status = "none"
                            references.score[e.key] = true
                        end
                    end

                end
            end

        end}
    },
    {"love update", "change gravity status effect", 
        {function(e)
            if e.status == "gravity" then
                for i = 1, #e.tallix_sensor_body:getContactList() do
                    local fixture_1, fixture_2 = e.tallix_sensor_body:getContactList()[i]:getFixtures()
                    if fixture_1:getUserData() == "tallix ball" or fixture_2:getUserData() == "tallix ball"  then
                        if e.tallix_sensor_body:getContactList()[i]:isTouching() then
                            if references.gravity == "down" then
                                references.gravity = "up"
                                for i = 1, #references.tallix_gravity_list do
                                    if references.tallix_gravity_list[i] == e.id then
                                        references.tallix_gravity_list[i] = 0
                                    end
                                end
                                e.status = "none"
                            elseif references.gravity == "up" then
                                references.gravity = "down"
                                for i = 1, #references.tallix_gravity_list do
                                    if references.tallix_gravity_list[i] == e.id then
                                        references.tallix_gravity_list[i] = 0
                                    end
                                end
                                e.status = "none"
                            end
                        end
                    end
                end

            end
        end}
    },
    {"love update", "gravity status",
        {function(e)
            for i = 1, #references.tallix_gravity_list do
                if references.tallix_gravity_list[i] == e.id and e.status == "none" then
                    e.status = "gravity"
                end
            end
        end}
    },

    {"love draw", "draw tallix key", 
        {function(e)
            references.entities[e.camera_name]:attach()
            if e.status == "key" then
                if e.tallix_type == 4 then
                    for i = 1, 3 do
                        love.graphics.setColor(255,139,139)
                        love.graphics.polygon( e.draw_mode,e.body:getWorldPoints(e.shape[i]:getPoints())) 
                    end
                else
                    for i = 1, 4 do
                        love.graphics.setColor(255,139,139)
                        love.graphics.polygon( e.draw_mode,e.body:getWorldPoints(e.shape[i]:getPoints())) 
                    end

                end
                love.graphics.setColor(255,255,255)
            end
            references.entities[e.camera_name]:detach()


        end
        }
    },
    {"love draw", "draw gravity effect", 
        {function(e)
            references.entities[e.camera_name]:attach()
            if e.status == "gravity" then
                if e.tallix_type == 4 then
                    for i = 1, 3 do
                        love.graphics.setColor(13,200,13, 100)
                        love.graphics.polygon( e.draw_mode,e.body:getWorldPoints(e.shape[i]:getPoints())) 
                    end
                else
                    for i = 1, 4 do
                        love.graphics.setColor(13,200,13, 100)
                        love.graphics.polygon( e.draw_mode,e.body:getWorldPoints(e.shape[i]:getPoints())) 
                    end

                end
                love.graphics.setColor(255,255,255)
            end
            references.entities[e.camera_name]:detach()
        end}
    }, 
    {"love draw", "debug tallix status", 
        {function(e)
            if e.debug then
                lg.print(references.gravity)
            end
        end}
    }
}

return tallix_status