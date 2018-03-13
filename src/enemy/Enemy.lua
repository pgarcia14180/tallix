local middleclass = require"libs.middleclass"
local functions = require"functions"
local lume = require"libs.lume"
local Class = require"src.Class"
local modules = require"src.modules"

local Enemy={}
Enemy = middleclass("Enemy", Class.generic)
functions.insert_modules(Enemy, modules, "ball", "load ball", "draw ball", "enemy components", "wanderer components", "load wanderer", "move enemy linearly", "debug enemy", "kill tallix ball when collided")



return Enemy