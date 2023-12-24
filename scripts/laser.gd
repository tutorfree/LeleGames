extends Area2D

var speed = -600

func _ready():
	pass

func _process(delta):
	position.x -= speed * delta
	
	if position.x > 1020:
		queue_free()
