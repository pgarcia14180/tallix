
local label = {

    {"component", "label components",
        {
            x = 0,
            y = 0,
            font_size = "small",
            small_font = love.graphics.newFont("assets/INVASION2000.TTF", 12),
            medium_font = love.graphics.newFont("assets/INVASION2000.TTF", 24),
            large_font = love.graphics.newFont("assets/INVASION2000.TTF", 48),
            limit = 100,
            align = "left",
            text = "hello world",
            row = 1,
            column = 1,
            rotation = 0,
            size_x = 1,
            size_y = 1

        }
    },

    {"love load", "load label",
        {function(e)
            e.x = references.grid.rows[e.row]["y"]
            e.y = references.grid.columns[e.column]["x"]
        end}
    },


    {"love draw", "draw label",
        {function(e)
            if e.font_size == "small" then
                love.graphics.setFont(e.small_font)
            elseif e.font_size == "medium" then
                love.graphics.setFont(e.medium_font)
            elseif e.font_size == "large" then
                love.graphics.setFont(e.large_font)
            end
            love.graphics.printf(e.text, e.x, e.y, e.limit, e.align, e.rotation, e.size_x, e.size_y)
        end}
    }
}

return label