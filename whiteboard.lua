local tallix_grid = {

	{0,0,0,0,0,0,0,},
	{0,0,0,0,0,0,},
	{0,0,0,0,0,0,0,},
	{0,0,0,0,0,0,},
	{0,0,0,0,0,0,0,},
	{0,0,0,0,0,0,},
	{0,0,0,0,0,0,0,},
	{0,0,0,0,0,0,},
	{0,0,0,0,0,0,0,},
	{0,0,0,0,0,0,},
	{0,0,0,0,0,0,0,},

} 
function functions.create_tallix_grid(starting_x, starting_y, tallix_grid, entities)
	local x_gap = 226
	local y_gap = 113
	local tallix = {}
	local _x = 0
	local _y = 0

	for i = 1, #tallix_grid do
		_y = starting_y + y_gap*i
		for j = 1, #tallix_grid[i] do
			if (i % 2 == 0) then
				_x = starting_x + (x_gap*j)+113
			else
				_x = starting_x + x_gap*j
			end
			if tallix_grid[i][j] == 0 then
				tallix[#tallix+1] = Tallix:new()
				tallix[#tallix].add = {x = _x, y = _y} 
				load_entity(tallix[#tallix], entities)

			end
		end
	end
end
