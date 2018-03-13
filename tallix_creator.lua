local Tallix = require"src.tallix.Tallix"
local TallixLimit = require"src.tallix_limit.TallixLimit"
local functions = require"functions"

function create_tallix_grid(entities, tallix_grid, starting_x, starting_y)
	local x_gap = 226
	local y_gap = 113
	local tallix = {}
	local _x = 0
	local _y = 0
	references.tallix = {}
	references.tallix_quantity = 0
	for i = 1, #tallix_grid do
		_y = starting_y + y_gap*i
		references.tallix[#references.tallix+1] = {}
		for j = 1, #tallix_grid[i] do
			if (i % 2 == 0) then
				_x = starting_x + (x_gap*j)+113
			else
				_x = starting_x + x_gap*j
			end
			references.tallix[i][j] = { x = _x, y = _y}
			if tallix_grid[i][j] == "L" or tallix_grid[i][j] == "u" or tallix_grid[i][j] == "d"  then
				tallix[#tallix+1] = TallixLimit:new()
			else
				references.tallix_quantity = references.tallix_quantity+1
				tallix[#tallix+1] = Tallix:new()
			end
			if tallix_grid[i][j] == "L" then
				tallix[#tallix].add = {x = _x, y = _y, name = "limit"}
			elseif tallix_grid[i][j] == "u" then
				tallix[#tallix].add = {x = _x, y = _y, name = "limit", limit_type = "gravity up"}
			elseif tallix_grid[i][j] == "d" then
				tallix[#tallix].add = {x = _x, y = _y, name = "limit", limit_type = "gravity down"}
			elseif tallix_grid[i][j] == "r" then
				tallix[#tallix].add = {id = references.tallix_quantity,x = _x, y = _y, name = "tallix["..tostring(i).."]["..tostring(j).."]"} 
			elseif tallix_grid[i][j] == "s" then
				references.ball_start_x, references.ball_start_y = _x, _y
				tallix[#tallix].add = {id = references.tallix_quantity, x = _x, y = _y, name = "tallix["..tostring(i).."]["..tostring(j).."]", tallix_type = 5, status = "start"} 
			elseif tallix_grid[i][j] == "l1" then
				--tallix types l = 1, x = 2, t = 3, a = 4, i = 5
				tallix[#tallix].add = {id = references.tallix_quantity, x = _x, y = _y, name = "tallix["..tostring(i).."]["..tostring(j).."]", status = "key", tallix_type = 1, key = "l1"}
			elseif tallix_grid[i][j] == "l2" then
				--tallix types l = 1, x = 2, t = 3, a = 4, i = 5
				tallix[#tallix].add = {id = references.tallix_quantity, x = _x, y = _y, name = "tallix["..tostring(i).."]["..tostring(j).."]", status = "key", tallix_type = 1, key = "l2"} 
			elseif tallix_grid[i][j] == "x" then
				tallix[#tallix].add = {id = references.tallix_quantity, x = _x, y = _y, name = "tallix["..tostring(i).."]["..tostring(j).."]", status = "key", tallix_type = 2, key = "x"} 
			elseif tallix_grid[i][j] == "t" then
				tallix[#tallix].add = {id = references.tallix_quantity, x = _x, y = _y, name = "tallix["..tostring(i).."]["..tostring(j).."]", status = "key", tallix_type = 3, key = "t"} 
			elseif tallix_grid[i][j] == "a" then
				tallix[#tallix].add = {id = references.tallix_quantity, x = _x, y = _y, name = "tallix["..tostring(i).."]["..tostring(j).."]", status = "key", tallix_type = 4, key = "a"} 
			elseif tallix_grid[i][j] == "i" then
				tallix[#tallix].add = {id = references.tallix_quantity, x = _x, y = _y, name = "tallix["..tostring(i).."]["..tostring(j).."]", status = "key", tallix_type = 5, key = "i"} 
			end
			functions.load_entity(tallix[#tallix], entities)
		end
	end
end

return create_tallix_grid