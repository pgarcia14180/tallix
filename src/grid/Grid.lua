local class = require"libs.middleclass"
local functions = require"functions"
local lume = require"libs.lume"
local Class = require"src.Class"
local modules = require"src.modules"

local Grid={}
Grid = class("generic grid", Class.generic)
functions.insert_modules(Grid, modules, "set grid", "create rows", "draw rows", "create columns", "draw columns", "resize grid width", "reference grid")


return Grid