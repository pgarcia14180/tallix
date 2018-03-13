local class = require"libs.middleclass"
local functions = require"functions"
local lume = require"libs.lume"
local Class = require"src.Class"
local modules = require"src.modules"

local Camera = {}
Camera.general = class("camera", Class.generic)
functions.insert_modules(Camera.general, modules, "camera components", "load camera", "update camera", "reference camera", "draw in camera")

return Camera