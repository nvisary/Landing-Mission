extends RigidBody2D


var yspeed = 10000
var xspeed = 10000

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('ui_left'):
		#set_axis_velocity(Vector2(-xspeed, 0))
		apply_central_force(Vector2(-xspeed * 5 * delta, 0))
	if Input.is_action_pressed('ui_right'):
		#set_axis_velocity(Vector2(xspeed, 0))
		apply_central_force(Vector2(xspeed * 5 * delta, 0))
	if Input.is_action_pressed('ui_up'):
		#set_axis_velocity(Vector2(0, -yspeed))
		apply_central_force(Vector2(0,-yspeed * 10 * delta))
