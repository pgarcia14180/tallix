local tallix_block = {
	{"component", "tallix block",
        {tallix_block_shapes = 
            {  
                {82.9778,   -2.35556 ,
                70.4778,   -45.0222 ,
                112.478,   -29.5222 ,
                83.4778,   -1.52222 , },
                {83.4778,   -1.52222 ,
                111.978,   30.4778 ,
                72.4778,   38.4778 ,
                83.9778,   0.977778,  },
                {-80.9961,   0.33724 ,
                -72.9961,   -43.6628 ,
                -96.3294,   -31.6628 ,
                -80.9961,   3.00391 },
                {-80.9961,   3.00391 ,
                -92.9961,   32.3372 ,
                -71.1628,   43.4206 ,
                -80.8657,   3.09086 }

            },
        tallix_block_collision_category = 0000000000000000,
        tallix_block_collision_mask = 0000000000000000,
        tallix_block_collision_group = 2,

        }

    },
    {"love load", "load tallix block", 
        {function(e)
            e.tallix_block_body = love.physics.newBody(references.world, e.x, e.y, e.physics_type)
            e.tallix_block_shape = {}
            e.tallix_block_fixture = {}
            for i = 1, 4 do
                e.tallix_block_shape[i] = love.physics.newPolygonShape(e.tallix_block_shapes[i])
                e.tallix_block_fixture[i] = love.physics.newFixture(e.tallix_block_body, e.tallix_block_shape[i])
                e.tallix_block_fixture[i]:setFilterData(e.tallix_block_collision_category, e.tallix_block_collision_mask, e.tallix_block_collision_group)
            end
        end
        }
    },
    {"love draw", "draw tallix block", 
        {function(e)
            references.entities[e.camera_name]:attach()

            for i = 1, 4 do
                love.graphics.setColor(0,139,139)
                love.graphics.polygon( e.draw_mode,e.tallix_block_body:getWorldPoints(e.tallix_block_shape[i]:getPoints())) 
            end
            references.entities[e.camera_name]:detach()
            
        end
        }
    },

}

return tallix_block