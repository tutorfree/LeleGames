extends Node2D

var pre_enemy = preload("res://scenes/enemy.tscn")
var tempo = 0
var tempo_max = 1
var tempo_restante = 50

export var pontos = 0
#a variavel txt_label representará a label score
onready var txt_label = $score

func _ready():
	pass # Replace with function body.

func _process(delta):
	#atraves da variavel txt_label estamos acessando a propriedade 'text' d label
	txt_label.text = str(pontos)
	
	$tempo.text = str(int(tempo_restante))
	tempo_restante -= delta
	if tempo_restante < 1:
		tempo_restante = 0
		$tempo.visible = false
	
	if tempo_restante > 0:
		tempo += delta
		if tempo > tempo_max:
			spawn_enemy()
			tempo_max = rand_range(1,2)
			tempo = 0


func spawn_enemy():
	var e = pre_enemy.instance()
	e.position = Vector2(1030,rand_range(50,600))
	add_child(e)
