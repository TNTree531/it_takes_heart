extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("next"):
		if Global.active_player == 'red':
			Global.next_player = 'purple'
			Global.last_player = 'blue'
		elif Global.active_player == 'purple':
			Global.next_player = 'blue'
			Global.last_player = 'red'
		elif Global.active_player == 'blue':
			Global.next_player = 'red'
			Global.last_player = 'blue'
		Global.active_player = Global.next_player
		
		
	if Input.is_action_just_pressed("last"):
		Global.active_player = Global.last_player
	if Global.active_player == 'red':
		Global.next_player = 'purple'
		Global.last_player = 'purple'
	elif Global.active_player == 'purple':
		Global.next_player = 'red'
		Global.last_player = 'red'
	elif Global.active_player == 'blue':
		Global.next_player = 'red'
		Global.last_player = 'blue'
