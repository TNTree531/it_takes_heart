extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Global.active_player == 'red':
		global_position = get_tree().get_root().get_node('Main/Red_guy').global_position
	if Global.active_player == 'purple':
		global_position = get_tree().get_root().get_node('Main/Purple_guy').global_position
	
	if global_position.y <= -2850:
		get_tree().get_root().get_node('Main/dawn').visible = false
		get_tree().get_root().get_node('Main/night').visible = true
	else:
		get_tree().get_root().get_node('Main/dawn').visible = true
		get_tree().get_root().get_node('Main/night').visible = false
