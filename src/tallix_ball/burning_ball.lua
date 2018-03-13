local burning_ball = {

    {"component", "burning ball components", 
        {
            burning_limit = 100,
            burning_speed = 3,
            refreshing_unit = 5,
            burning_state = 0,

        }
    },

    {"love update", "burn ball", 
        {function(e)
            if e.is_moving == false then
                e.burning_state == e.burning_state+references.delta_time
            end
        end}
    },
    {"love update", "burned ball", {function(e)
        if e.burning_state > e.burning_limit then
            references.kill_ball = true
        end
    end}},
    {"love update", "refresh ball", {function(e)
        if references.combo_resetted then
            if e.burning_state-(references.combo_count*e.refreshing_unit) > 0 then
                e.burning_state = e.burning_state-(references.combo_count*e.refreshing_unit)
            else 
                e.burning_state = 0
            end
        end
    end}}
}
--draw burning ball, refresh ball, 

return burning_ball