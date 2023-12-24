extends KinematicBody2D

# Definindo a variável velocidade
var vel = 400
var tempo_movimento = 0
var controlar_player = false
onready var pos_inicial = global_position

const PRE_LASER = preload("res://scenes/laser.tscn")
const PRE_BRILHO = preload("res://scenes/brilho.tscn")

func _ready():
	pass # Replace with function body.


# warning-ignore:unused_argument
func _process(delta):
	
	var dir = Vector2(0,0)
	
	# Movimentação da nave nas 4 direções
	if Input.is_action_pressed("right"):
		dir.x = 1
	if Input.is_action_pressed("left"):
		dir.x = -1
	if Input.is_action_pressed("up"):
		dir.y = -1
	if Input.is_action_pressed("down"):
		dir.y = 1
	
#	move_and_slide(dir * vel)
#	if Input.is_action_just_pressed("shoot"):
#		laser()

# warning-ignore:return_value_discarded
	if controlar_player:
		move_and_slide(dir * vel)
		
		if Input.is_action_just_pressed("shoot") and get_tree().get_nodes_in_group("laser").size() < 3:
			brilho(global_position + Vector2(50,5)) 
			laser()
	else:
		position.x += vel * delta
		tempo_movimento += delta
		if tempo_movimento > 0.5:
			controlar_player = true
			tempo_movimento = 0


func laser():
	$sound_laser.play()
	var l = PRE_LASER.instance()
	l.position = position + Vector2(50,5)
	get_parent().add_child(l)
	l.add_to_group("laser")


func brilho(node_pos):
	var b = PRE_BRILHO.instance()
	b.position = node_pos
	get_parent().add_child(b)
