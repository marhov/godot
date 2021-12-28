extends RigidBody

var thrust_fw = 0

func _ready():
	pass

func _input(event):
	if Input.is_action_pressed("move_forward"):
		thrust_fw = -200
		print("key press")
	if Input.is_action_pressed("move_back"):
		thrust_fw = 200

func _integrate_forces(_state):
	if thrust_fw != 0:
		add_force(get_global_transform().basis.z * (thrust_fw), get_global_transform().basis.z)
		thrust_fw = 0
