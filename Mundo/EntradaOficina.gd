extends Area2D

var dentro = false
@onready var player = $"../../../Player"
@onready var marker = $Marker2D
var oficina = Vector2()
# Called when the node enters the scene tree for the first time.

func _ready():
	oficina = marker.global_position
	
func _process(delta):
	if Status0.tpOficina == true:
		if Input.is_action_pressed("e") and dentro == true:
			teletransporte()
			Status0.tpOficina = false
			$Timer.start()
	
func teletransporte():
	Status0.minVisible = false
	player.global_position = oficina
	
func _on_body_entered(body):
	dentro = true 
	Status0.mostrarE = true

func _on_body_exited(body):
	dentro = false
	Status0.mostrarE = false

func _on_timer_timeout():
	Status0.tpOficina = true
