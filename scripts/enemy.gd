extends Area2D

# declaração das variáveis
var vel = 300
var s = 0
const PRE_EXPLOSAO = preload("res://scenes/explosao.tscn")

func _ready():
	pass


func _process(delta):
	
	position.x -= vel * delta
	
	if position.x < 0:
		queue_free()
  

func _on_enemy_area_entered(area):
	# 1 - acessa o elemento pai; 2 - acessa a variável pontos
	get_parent().pontos += 3
	if area.is_in_group("laser"):
		explosao()
		queue_free()
		area.queue_free()

func explosao():
	var e = PRE_EXPLOSAO.instance()
	e.position = position
	get_parent().add_child(e)


func _on_enemy_body_entered(body):
	body.global_position = body.pos_inicial
	body.controlar_player = false
	queue_free()
