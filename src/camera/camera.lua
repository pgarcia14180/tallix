local stalker = require"libs.Camera"

local camera = {
	{"component", "camera components", {
	name = "camera1",
	width = 800, 
	height = 600,
	x = 0,
	y = 0,
	scale = 0.3,
	rotation = 0,
	follow_style = "TOPDOWN",
	lerp = 0.3,
	lead = 0,
	}},
	{"love load", "load camera", {function(e)
		e.camera = stalker( e.width/2, e.height/2, e.width, e.height, e.scale, e.rotation)
	end
	}},
	{"love load", "reference camera", {function(e)
		if references.entities == nil then
			references.entities = {}
			references.entities[e.name] = e.camera
		end
	end}},
	{"love update", "focus camera on object", 
		{function(e)
			references.entities[e.camera_name]:follow(e.x, e.y)
		end}
	},
	{"love update", "update camera", {function(e)
		references.entities[e.name] = e.camera
		e.camera:update()
		e.camera:setFollowStyle(e.follow_style)
		e.camera:setFollowLerp(e.lerp)
		e.camera:setFollowLead(e.lead)
	end
	}},


}

return camera