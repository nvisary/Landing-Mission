extends RigidBody2D

var yforce = 50000 
var xforce = 25000
var torque = 1000000

@onready var particle_left: CPUParticles2D = $Left
@onready var particle_right: CPUParticles2D = $Right

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_just_released("left_engine"):
		particle_left.hide()
		
	if Input.is_action_just_released("right_engine"):
		particle_right.hide()
	
	if Input.is_action_pressed('rotation_left'):
		apply_torque(-torque * delta)
	if Input.is_action_pressed('rotation_right'):
		apply_torque(torque * delta)
	if Input.is_action_pressed('left_engine') and not Input.is_action_pressed('right_engine'):
		particle_left.show()
		apply_central_force(Vector2(xforce * delta, 0).rotated(rotation))
	if Input.is_action_pressed('right_engine') and not Input.is_action_pressed("left_engine"):
		particle_right.show()
		apply_central_force(Vector2(-xforce * delta, 0).rotated(rotation))
	if Input.is_action_pressed('left_engine') and Input.is_action_pressed('right_engine'):
		particle_right.show()
		particle_left.show()	
		apply_central_force(Vector2(0,-yforce * delta).rotated(rotation))
		
