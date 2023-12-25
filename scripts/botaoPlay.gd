extends Button


func _ready():
	pass

# Renomear o argumento delta para _delta,
# para indicar que ele é intencionalmente ignorado. 
func _process(_delta):
	if Input.is_action_pressed("Jogar"):
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/fase.tscn")


func _on_Button_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/fase.tscn")
