extends Node2D

var dentro = false

func _process(delta):
	if dentro == true:
		Status0.mostrarE
		if Input.is_action_pressed("e"):
			Status0.ComidaDoom = true
			queue_free()

func _on_area_2d_body_entered(body):
	dentro = true
	Status0.mostrarE = true

func _on_area_2d_body_exited(body):
	dentro = false
	Status0.mostrarE = false
