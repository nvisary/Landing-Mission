extends RigidBody2D

var force_multipler = 1000000

@export var SHOW_DEBUG = true

var yforce = 50 * force_multipler 
var xforce = 25 * force_multipler
var torque = 2 * force_multipler

var max_velocity = Vector2(300, 200)

@onready var vspeed_label = $VSpeedLabel
@onready var hspeed_label = $HSpeedLabel

func _ready():
	if SHOW_DEBUG:
		vspeed_label.show()
		hspeed_label.show()
	
	set_process(true)
	
func display_speed():
	vspeed_label.text = 'v.speed: ' + str(round(linear_velocity.y))
	hspeed_label.text = 'h.speed: ' + str(round(linear_velocity.x))
	
func controls(delta):
	if Input.is_action_pressed("left_help_engine") and linear_velocity.x > -300:
		var force = Vector2(-xforce * delta, 0)
		apply_central_force(force.rotated(rotation))
	if Input.is_action_pressed("right_help_engine") and linear_velocity.x < 300:
		var force = Vector2(xforce * delta, 0)
		apply_central_force(force.rotated(rotation))
	if Input.is_action_pressed('main_engine'):
		var force = Vector2(0, -yforce) * delta
		apply_central_force(force.rotated(rotation))
		
func _integrate_forces(state):
	if rotation < -0.01 and Input.is_action_pressed("main_engine"):
		apply_torque(torque)
	if rotation > 0.01 and Input.is_action_pressed("main_engine"):
		apply_torque(-torque)

func _process(delta):
	controls(delta)
	if SHOW_DEBUG:
		display_speed()
		
