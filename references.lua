local references = {}

references.ball_is_active = false
references.combo_count = 0
references.combo_start = 3

references.score = {
	t = false,
	a = false,
	l1 = false,
	l2 = false,
	i = false, 
	x = false,
}

references.tallix_gravity_list = {}
references.gravity = "down"
references.grid = {rows = {}, columns = {}}
references.kill_ball = false
references.combo_resetted = false



return references