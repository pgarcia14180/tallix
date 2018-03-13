local functions = require"functions"
local lume = require"libs.lume"
local Grid = require"src.grid.Grid"
local Gui = require"src.gui.Gui"
local game_over = {}

local grid = Grid:new()
grid.add = {gamestate = "game_over", columns_quantity = 300, rows_quantity = 300, min_width = 10, min_height = 10, drawable = false}

local label = Gui.label:new()
label.add = {text = "Thanks for playing!", gamestate = "game_over", column = 5, row = 4, limit = 10000, size = 50, font_size = "large"}


functions.load_all_entities(game_over, grid, label, button)

return game_over