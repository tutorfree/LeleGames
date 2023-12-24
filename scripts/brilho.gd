extends Sprite


func _ready():
	$anim.play("brilho")
	$anim.connect("animation_finished", self, "destruir")


func destruir(obj):
	queue_free()
