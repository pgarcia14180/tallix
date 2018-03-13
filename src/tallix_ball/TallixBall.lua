local middleclass = require"libs.middleclass"
local functions = require"functions"
local lume = require"libs.lume"
local Class = require"src.Class"
local modules = require"src.modules"

local TallixBall={}
TallixBall = middleclass("TallixBall", Class.generic)
functions.insert_modules(TallixBall, modules, "tallix ball", "load ball", "draw ball", "focus camera on object", "update body position", "kill tallix ball", "get physics object velocity", "check if tallix ball is moving", "counts ball's inactivity", "check if tallix ball is active", "super ball", "debug ball")
--, "debug ball draw"

return TallixBall