local middleclass = require"libs.middleclass"
local functions = require"functions"
local lume = require"libs.lume"
local Class = require"src.Class"
local modules = require"src.modules"

local Tallix={}
Tallix = middleclass("Tallix", Class.generic)
functions.insert_modules(Tallix, modules, "tallix", "load tallix", "tallix shapes", "draw tallix images", "tallix block", "load tallix block", "rotate tallix", "stop tallix rotation", "control each tallix", "tallix sensor", "load tallix sensor", "check if mouse is hovering tallix", "make entity drawable", "tallix status components", "tallix status", "get tallix key", "draw tallix key", "add as comboed ball", "reset counter if combo misses", "draw super ball effect on tallix", "check if collided with super ball", "super ball collided counter", "reset super ball collided counter", "change gravity status effect", "draw gravity effect", "gravity status", "debug tallix status", "randomize tallix gravity position")
--, "sensor test"

return Tallix