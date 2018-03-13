local functions = {}
local lume = require"libs.lume"



function functions.add_to_class(c, m)
	local mergedTable = lume.merge(c.entity, m)
	c.entity = mergedTable
end

function functions.load_entity(o, entities)
	if type(o.add) == "table" then
		local mergedTable = lume.merge(o.entity, o.add)
		table.insert(entities, mergedTable)
	else
		table.insert(entities, o.entity)
	end
end

function functions.load_all_entities(entities, ...)
	local all_entities = {...}
	for i = 1, #all_entities do
		functions.load_entity(all_entities[i], entities)
	end
end

function functions.insert_modules(class, modules, ...)
	local table = {...}
	for i=1, #table do
		for i2=1, #modules do
			if modules[i2][1] == "component" then
				if table[i] == modules[i2][2] then
					class.entity = lume.merge(class.entity, modules[i2][3])
				end
			elseif modules[i2][1] == "love load" then
				if table[i] == modules[i2][2] then
					class.entity.load = lume.concat(class.entity.load, modules[i2][3])
				end
			elseif modules[i2][1] == "love update" then
				if table[i] == modules[i2][2] then
					class.entity.update = lume.concat(class.entity.update, modules[i2][3])
				end
			elseif modules[i2][1] == "love draw" then
				if table[i] == modules[i2][2] then
					class.entity.draw = lume.concat(class.entity.draw, modules[i2][3])
				end
			elseif modules[i2][1] == "love keypressed" then
				if table[i] == modules[i2][2] then
					class.entity.keypressed = lume.concat(class.entity.keypressed, modules[i2][3])
				end
			elseif modules[i2][1] == "love keyreleased" then
				if table[i] == modules[i2][2] then
					class.entity.keyreleased = lume.concat(class.entity.keyreleased, modules[i2][3])
				end
			elseif modules[i2][1] == "love mousepressed" then
				if table[i] == modules[i2][2] then
					class.entity.mousepressed = lume.concat(class.entity.mousepressed, modules[i2][3])
				end
			elseif modules[i2][1] == "love mousereleased" then
				if table[i] == modules[i2][2] then
					class.entity.mousereleased = lume.concat(class.entity.mousereleased, modules[i2][3])
				end
			elseif modules[i2][1] == "love textinput" then
				if table[i] == modules[i2][2] then
					class.entity.textinput = lume.concat(class.entity.textinput, modules[i2][3])
				end
			end
		end
	end
end

function functions.create_modules(modules, ...)
  local all_modules = {}
  for i = 1, #all_modules do
    for i2 = 1, #all_modules[i] do
      for i3 = 1, #all_modules[i][i2] do
		table.insert(modules, all_modules[i][i2][i3])
      end
    end
  end
end





return functions
