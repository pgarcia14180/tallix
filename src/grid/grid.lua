local class = require"libs.middleclass"
local functions = require"functions"
local lume = require"libs.lume" 

local grid = {
	{
	"component", "set grid",{
	grid_rows = 12,
	grid_columns =12,
	rows_quantity = 12,
	columns_quantity = 120, 
	min_width = 25,
	min_height = 25,
	gamestate = "grid_gamestate",
	}},


	{"love load", "create rows", {function(e)
		if lg.getWidth()/e.grid_columns > e.min_width then
			e.width_unit = lg.getWidth()/e.grid_columns
		else
			e.width_unit = e.min_width
		end
		if lg.getHeight()/e.grid_rows > e.min_height then
			e.height_unit = lg.getHeight()/e.grid_rows
		else
			e.height_unit = e.min_height
		end
		e.rows = {}
		for i = 1, e.rows_quantity do
			if #e.rows == 0 then
				e.rows[1] = {x = 0, y = 0, width = e.width_unit*e.columns_quantity, height = e.height_unit}
			else
				e.rows[#e.rows+1] = {x = 0, y = e.rows[#e.rows]["y"]+e.height_unit, width = e.width_unit*e.columns_quantity, height = e.height_unit}
			end
		end
	end}},

	{"love load", "create columns", {function(e)
		if lg.getWidth()/e.grid_columns > e.min_width then
			e.width_unit = lg.getWidth()/e.grid_columns
		else
			e.width_unit = e.min_width
		end
		if lg.getHeight()/e.grid_rows > e.min_height then
			e.height_unit = lg.getHeight()/e.grid_rows
		else
			e.height_unit = e.min_height
		end
		e.columns = {}
		for i = 1, e.columns_quantity do
			if #e.columns == 0 then
				e.columns[1] = {x = 0, y = 0, width = e.width_unit, height = e.height_unit*e.rows_quantity}
			else
				e.columns[#e.columns+1] = {x = e.columns[#e.columns]["x"]+e.width_unit, y = 0, width = e.width_unit, height = e.height_unit*e.rows_quantity}
			end
		end
	end}},

	{"love load", "reference grid", 
		{function(e)
			references.grid.rows = e.rows
			references.grid.columns = e.columns

		end}
	},

	{"love update", "resize grid width", {function(e)
		if lg.getWidth()/e.grid_columns > e.min_width then
			e.width_unit = lg.getWidth()/e.grid_columns
		else
			e.width_unit = e.min_width
		end
		if lg.getHeight()/e.grid_rows > e.min_height then
			e.height_unit = lg.getHeight()/e.grid_rows
		else
			e.height_unit = e.min_height
		end
		resize_rows_width = false
		for i = 1, e.columns_quantity do
			if i == 1 then
				e.columns[i]["width"] = e.width_unit
				e.columns[i]["height"] = e.height_unit*e.rows_quantity
				e.rows[i]["width"] = e.width_unit*e.columns_quantity
			else
				e.columns[i]["width"] = e.width_unit
				e.columns[i]["height"] = e.height_unit*e.rows_quantity
				e.columns[i]["x"] = e.columns[i-1]["x"]+e.width_unit
				if e.rows[i] ~= nil then
					resize_rows_width = true
				end
			end
		end
		if resize_rows_width then
			for i = 1, e.rows_quantity do
				e.rows[i]["width"] = e.width_unit*e.columns_quantity
			end
		end

	end}},

	{"love update", "resize grid height", {function(e)
		if lg.getWidth()/e.grid_columns > e.min_width then
			e.width_unit = lg.getWidth()/e.grid_columns
		else
			e.width_unit = e.min_width
		end
		if lg.getHeight()/e.grid_rows > e.min_height then
			e.height_unit = lg.getHeight()/e.grid_rows
		else
			e.height_unit = e.min_height
		end
		resize_columns_height = false
		for i = 1, e.rows_quantity do
			if i == 1 then
				e.rows[i]["width"] = e.width_unit*e.columns_quantity
				e.rows[i]["height"] = e.height_unit
				e.columns[i]["height"] = e.height_unit*e.rows_quantity
			else
				e.rows[i]["width"] = e.width_unit*e.columns_quantity
				e.rows[i]["y"] = e.rows[i-1]["y"]+e.height_unit
				e.rows[i]["height"] = e.height_unit
				if e.columns[i] ~= nil then
					resize_columns_height = true
				end
			end
		end
		if resize_columns_height then
			for i = 1, e.columns_quantity do
				e.columns[i]["height"] = e.height_unit*e.rows_quantity
			end
		end
	end}},


	{"love draw", "draw rows", {function(e)
		for i = 1, e.rows_quantity do
			lg.rectangle("line", e.rows[i]["x"], e.rows[i]["y"], e.rows[i]["width"], e.rows[i]["height"])
		end
	end}},

	{"love draw", "draw columns", {function(e)
		for i = 1, e.columns_quantity do
			lg.rectangle("line", e.columns[i]["x"], e.columns[i]["y"], e.columns[i]["width"], e.columns[i]["height"])
		end
	end}},
	
}

return grid
