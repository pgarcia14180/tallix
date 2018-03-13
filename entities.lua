local lume = require"libs.lume"
local tallix_test = require"gamestates.tallix_test"
local game_over = require"gamestates.game_over"
local main_menu = require"gamestates.main_menu"

local entities = {}

entities = lume.concat(tallix_test, main_menu, game_over)


return entities
