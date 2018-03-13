local class = require"libs.middleclass"
local functions = require"functions"
local Class = require"src.Class"
local modules = require"src.modules"

local Physics = {}
Physics.world = class("world", Class.generic)
functions.insert_modules(Physics.world, modules, "create world", "load world", "update world", "set collision callbacks", "collision components", "change world gravity", "reference contact list")
--"test contact"


Physics.ball = class("ball", Class.generic)
functions.insert_modules(Physics.ball, modules, "ball", "load ball", "draw ball", "update body data", "move ball", "focus camera on object", "character components", "ball keys down", "jump ball", "check if ball is in the air")

Physics.block = class("block", Class.generic)
functions.insert_modules(Physics.block, modules, "block", "load block", "draw block", "rotate block", "body x movement", "body y movement", "reference block velocity", "load reference block velocity")

return Physics