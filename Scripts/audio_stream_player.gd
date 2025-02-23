extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ability"):
		if Global.active_player == "red":
			if get_tree().get_root().get_node('Main/Purple_guy').velocity.y == 0:
				$AudioStreamPlayer.play()
	
	if Input.is_action_just_pressed("ui_accept"):
		$AudioStreamPlayer2.play()
	
	if Input.is_action_just_pressed("next") or Input.is_action_just_pressed("last"):
		$AudioStreamPlayer3.play()
