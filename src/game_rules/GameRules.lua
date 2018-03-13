local middleclass = require"libs.middleclass"
local functions = require"functions"
local lume = require"libs.lume"
local Class = require"src.Class"
local modules = require"src.modules"

local GameRules={}
GameRules = middleclass("GameRules", Class.generic)
functions.insert_modules(GameRules, modules, "draw adquired keys", "game rules components", "stage cleared", "create tallix gravity list",  "debug game rules", "exit level", "randomize tallix gravity position")

--, "test enemy"


return GameRules