extends Button


func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("sair"):
		get_tree().quit()
	
func _on_ButtonQuit_pressed():
	get_tree().quit()
