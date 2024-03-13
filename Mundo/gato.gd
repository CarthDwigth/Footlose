extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	play("default")

func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	play("cute")

func _on_area_2d_body_exited(body):
	play("default")
