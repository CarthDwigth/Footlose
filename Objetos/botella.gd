extends Node2D

var dentro = false

func _process(delta):
	if Status0.reciclando == true and dentro == true:
		Status0.Botellas += 1
		Status0.BotellasTo += 1
		queue_free()

func _on_area_2d_body_entered(body):
	dentro = true
