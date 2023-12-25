extends Button

func _ready():
	pass

func _process(_delta):
	if Input.is_action_pressed("voltar"):
		get_tree().change_scene("res://scenes/telaInicial.tscn")

func _on_voltar_pressed():
		get_tree().change_scene("res://scenes/telaInicial.tscn")

