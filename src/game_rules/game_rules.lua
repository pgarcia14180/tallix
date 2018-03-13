local Timer = require 'libs.Timer'
local game_rules = {
    
    {"component", "game rules components", 
        {
        stage_cleared = false,
        debug = false,
        go_to = "game_over",
        tallix_gravity_list_not_created = true,
        }
    },
    {"love update", "create tallix gravity list", 
        {function(e)
            if e.tallix_gravity_list_not_created then
                for i = 1, references.tallix_quantity/20 do
                    references.tallix_gravity_list[#references.tallix_gravity_list+1] = math.random(1, references.tallix_quantity)
                end
                e.tallix_gravity_list_not_created = false
            end
        end}
    },

    {"love load", "randomize tallix gravity position", 
        {function(e)
            e.stage_cleared = false
            e.timer = Timer()
            e.timer:every(3,
                function()  
                    references.tallix_gravity_list[math.random(#references.tallix_gravity_list)] = math.random(references.tallix_quantity)
                end)
        end}
    },


	{"love update", "stage cleared", 
        {function(e)
            if references.score.t and references.score.a and references.score.l1 and references.score.l2 and references.score.i and references.score.x then
                e.stage_cleared = true
            end
        end}
    },
    
    {"love update", "exit level",
    {function(e)
        if e.stage_cleared then
                references.score.t = false
                references.score.a = false
                references.score.l1 = false
                references.score.l2 = false
                references.score.i = false
                references.score.x = false
                gs = e.go_to

                love.load()
            end
            
        end}
    },


    {"love draw", "draw adquired keys", 
        {function(e)
            if references.score.t then
            	lg.print("T", 500, 0, 0, 2)
            end
            if references.score.a then
                lg.print("A", 515, 0, 0, 2)
            end
            if references.score.l1 then
                lg.print("L", 530, 0, 0, 2)
            end
            if references.score.l2 then
                lg.print("L", 545, 0, 0, 2)
            end
            if references.score.i then
                lg.print("I", 560, 0, 0, 2)
            end
            if references.score.x then
                lg.print("X", 575, 0, 0, 2)
        	end

        end}
    },
    {"love draw", "debug game rules", 
        {function(e)
            if e.debug then
                for i = 1, #references.tallix_gravity_list do
                    lg.print(tostring(references.tallix_gravity_list[i]), 0, i*20)
                end
            end
        end}
    }



}

return game_rules