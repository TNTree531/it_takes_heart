extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.active_number == 1:
		Global.active_player = 'red'
		
	if Global.active_number == 2:
		Global.active_player = 'purple'
		
	if Global.active_number == 3:
		Global.active_player = 'blue'
		
	if Input.is_action_just_pressed("next"):
		print(Global.active_list)
		if Global.active_list.size() == 3:
			if Global.active_number == 1:
				Global.active_number = 2
			elif Global.active_number == 2:
				Global.active_number = 3
			else:
				Global.active_number = 1
		
		if Global.active_list.size() == 2:
			if Global.active_number == 1:
				Global.active_number = 2
			else: 
				Global.active_number = 1
				
				
				
	if Input.is_action_just_pressed("last"):
		print(Global.active_list)
		if Global.active_list.size() == 3:
			if Global.active_number == 1:
				Global.active_number = 3
			elif Global.active_number == 2:
				Global.active_number = 1
			else:
				Global.active_number = 2
		
		if Global.active_list.size() == 2:
			if Global.active_number == 1:
				Global.active_number = 2
			else: 
				Global.active_number = 1
		
		
	
	
