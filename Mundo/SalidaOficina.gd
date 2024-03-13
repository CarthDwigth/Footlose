extends Area2D

var dentro = false
@onready var marker = $Marker2D
var calle = Vector2()
@onready var player = $"../../../Player"

func _ready():
	calle = marker.global_position

func _process(delta):
	if Status0.tpOficina == true:
		if Input.is_action_pressed("e") and dentro == true:
			$Timer.start()
			teletransporte()
			Status0.tpOficina = false

func teletransporte():
	Status0.minVisible = true
	player.global_position = calle
	
func _on_body_entered(body):
	dentro = true
	Status0.mostrarE = true

func _on_body_exited(body):
	dentro = false
	Status0.mostrarE = false

func _on_timer_timeout():
	Status0.tpOficina = true
