extends RigidBody2D

var yforce = 100000 / 2
var xforce = 100000 / 4
var torque = 1000000

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_pressed('rotation_left'):
		apply_torque(-torque * delta)
	if Input.is_action_pressed('rotation_right'):
		apply_torque(torque * delta)
	if Input.is_action_pressed('left_engine') and not Input.is_action_pressed('right_engine'):
		apply_central_force(Vector2(xforce * delta, 0).rotated(rotation))
	if Input.is_action_pressed('right_engine') and not Input.is_action_pressed("left_engine"):
		apply_central_force(Vector2(-xforce * delta, 0).rotated(rotation))
	if Input.is_action_pressed('left_engine') and Input.is_action_pressed('right_engine'):
		apply_central_force(Vector2(0,-yforce * delta).rotated(rotation))
		
