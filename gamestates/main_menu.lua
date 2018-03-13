local functions = require"functions"
local lume = require"libs.lume"
local Grid = require"src.grid.Grid"
local Gui = require"src.gui.Gui"
local main_menu = {}

local grid = Grid:new()
grid.add = {gamestate = "main_menu", columns_quantity = 300, rows_quantity = 300, min_width = 10, min_height = 10, drawable = false}

local label = Gui.label:new()
label.add = {text = "Hi, this is the prototype of tallix, a game where you should guide a small ball to get the tallix keys which are colored in pink. The green tallix change the gravity direction and also touching the upper or lower limits.", gamestate = "main_menu", column = 4, row = 3, limit = 600, font_size = "medium"}

local button = Gui.button:new()
button.add = {text = "Click here to start the game", gamestate = "main_menu", column = 8, row = 6, limit = 10000, button_function = function() gs = "tallix_test" love.load() end}

functions.load_all_entities(main_menu, grid, label, button)

return main_menu