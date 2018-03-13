local button = {
    {"component", "button components", 
        {
        width = 200,
        height = 50,
        hovered = false,
        clicked = false,
        debug = false,
        button_function = function() end
        }
    },

    {"love update", "hover button", {function(e)
        if love.mouse.getX() > e.x and love.mouse.getX() < e.x+e.width and love.mouse.getY() > e.y and love.mouse.getY() < e.y+e.height then
            e.hovered = true
        else
            e.hovered = false
        end
    end}},

    {"love update", "click button", {function(e)
        if e.hovered and love.mouse.isDown(1) then
            e.clicked = true
        end
    end}},

    {"love update", "button function", {function(e)
        if e.clicked then
            e.button_function()
            e.clicked = false
        end
    end}},

    {"love draw", "debug button", {function(e)
        if e.debug then
            lg.print("is hovered "..tostring(e.hovered), 0, 60)
            lg.print("is clicked "..tostring(e.clicked), 0, 80)
        end
    end}}


}

return button