extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.name == "red_area":
		if get_tree().get_root().get_node('Main/Red_guy/heart').modulate.a > 0.1:
			print('ye')
			if Global.pressed == false:
				Global.pressed = true
				position.y += 50
			else:
				Global.pressed = false
				position.y -= 50
				
	if area.name == 'other_detector':
		if Global.pressed == false:
			Global.pressed = true
			if self.name == 'button2':
				position.x += 50
			else:
				position.y += 50
		else:
			Global.pressed = false
			if self.name == 'button2':
				position.x -= 50
			else:
				position.y -= 50
