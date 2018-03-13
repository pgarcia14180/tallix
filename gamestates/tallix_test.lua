local functions = require"functions"
local lume = require"libs.lume"
local Camera = require"src.camera.Camera"
local Physics = require"src.physics.Physics"
local tallix_creator = require"tallix_creator"
local Tallix = require"src.tallix.Tallix"
local TallixBall = require"src.tallix_ball.TallixBall"
local Enemy = require"src.enemy.Enemy"
local GameRules = require"src.game_rules.GameRules"
local tallix_test = {}


local camera1 = Camera.general:new()
camera1.add = {zoom_level = 0.01, x = 401, y = 400}

local world1 = Physics.world:new()
world1.add = {gamestate = "tallix_test"}

local tallix_grid = {

	{"d","d","d","d","d","d","d","d","d","d","d"},
	{"L","r","s","r","r","i","r","r","x","L",},
	{"L","r","r","r","r","r","r","r","r","r","L",},
	{"L","r","r","r","r","r","r","r","r","L",},
	{"L","r","a","r","r","r","r","r","r","L",},
	{"L","r","r","r","r","r","r","r","r","L",},
	{"L","r","r","r","r","r","r","r","r","r","L",},
	{"L","r","r","r","r","r","t","r","r","L",},
	{"L","r","r","r","r","r","r","r","r","r","L",},
	{"L","r","r","r","r","r","r","r","r","L",},
	{"L","r","r","r","r","r","r","r","r","r","L",},
	{"L","r","r","r","r","l2","r","r","r","L",},
	{"L","r","r","r","r","r","r","r","r","r","L",},
	{"L","r","r","l1","r","r","r","r","r","u",},
	{"u","u","u","u","u","u","u","u","u","u"},

}

--local enemy1 = Enemy:new()
--local enemy2 = Enemy:new()
--enemy1.add = {seed = 40, x = 200, y = 500, size = 40, camera = "camera1", gamestate = "tallix_test", starting_interval = 3, ending_interval = 7, draw_mode = "fill" }
--enemy2.add = { x = -800, y = -300, size = 80, camera = "camera1", gamestate = "tallix_test", starting_interval = 1, ending_interval = 3, seed = 60, debug = false}
local game_rules = GameRules:new()
game_rules.add = {gamestate = "tallix_test"}
functions.load_all_entities(tallix_test, camera1, world1, game_rules)
create_tallix_grid(tallix_test, tallix_grid, -800, -500) 
local ball1 = TallixBall:new()
ball1.add = {x = references.ball_start_x, y = references.ball_start_y}
functions.load_entity(ball1, tallix_test)


return tallix_test