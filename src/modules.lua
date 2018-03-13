local functions = require"functions"
local lume = require"libs.lume"
local grid = require"src.grid.grid"
local ball = require"src.physics.ball"
local block = require"src.physics.block"
local world = require"src.physics.world"
local camera = require"src.camera.camera"
local tallix = require"src.tallix.tallix"
local tallix_ball = require"src.tallix_ball.tallix_ball"
local tallix_status = require"src.tallix.tallix_status"
local tallix_limit = require"src.tallix_limit.tallix_limit"
local tallix_block = require"src.tallix.tallix_block"
local tallix_sensor = require"src.tallix.tallix_sensor"
local game_rules = require"src.game_rules.game_rules"
local enemy = require"src.enemy.enemy"
local wanderer = require"src.enemy.wanderer"
local label = require"src.gui.label"
local button = require"src.gui.button"

local modules = {}
modules = lume.concat(ball, tallix, tallix_ball, tallix_status, tallix_limit, tallix_sensor, enemy, tallix_block, block, grid, world, camera, game_rules, wanderer, label, button)

return modules


