local middleclass = require"libs.middleclass"
local functions = require"functions"
local Class = require"src.Class"
local modules = require"src.modules"

local Gui = {}
Gui.label = middleclass("label", Class.generic)
functions.insert_modules(Gui.label, modules, "label components", "load label", "draw label")
Gui.button = middleclass("button", Class.generic)
functions.insert_modules(Gui.button, modules, "label components", "load label", "draw label", "button components", "hover button", "click button", "debug button", "button function")

return Gui