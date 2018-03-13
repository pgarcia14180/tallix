local class = require"libs.middleclass"
local functions = require"functions"
local lume = require"libs.lume"
local Class = require"src.Class"
local modules = require"src.modules"

local TallixLimit={}
TallixLimit = class("generic grid", Class.generic)
functions.insert_modules(TallixLimit, modules, "tallix limit", "load ball", "draw ball", "tallix block", "load tallix block", "check if fixture is colliding with tallix ball", "activate gravity change", "tallix limit debug draw")


return TallixLimit