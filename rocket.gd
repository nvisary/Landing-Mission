extends RigidBody2D


var yspeed = 10000
var xspeed = 10000

var main_thrust = 1000 # Основная тяга
var force_applied = Vector2()

func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2(cos(rotation), sin(rotation))
	
	
	if Input.is_action_pressed('ui_left'):
		#set_axis_velocity(Vector2(-xspeed, 0))
		
		apply_central_force(Vector2(-xspeed * 5 * delta, 0).rotated(rotation))
	if Input.is_action_pressed('ui_right'):
		#set_axis_velocity(Vector2(xspeed, 0))
		apply_central_force(Vector2(xspeed * 5 * delta, 0).rotated(rotation))
	if Input.is_action_pressed('ui_up'):
		#set_axis_velocity(Vector2(0, -yspeed))
		apply_central_force(Vector2(0,-yspeed * 10 * delta).rotated(rotation))
		
