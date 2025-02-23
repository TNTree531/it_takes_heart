extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Global.pressed == true:
		gravity_scale = 1
		global_position.y -= 0.1
	else:
		gravity_scale = -1
		global_position.y += 0.1
	
