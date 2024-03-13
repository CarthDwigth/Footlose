extends Area2D

@onready var player = $"../../../Player"
@onready var marker = $Marker2D
var edificio = Vector2()
var dentro = false
# Called when the node enters the scene tree for the first time.

func _ready():
	edificio = marker.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Status0.tpCuarto == true:
		if Input.is_action_pressed("e") and dentro == true:
			teletransporte()
			Status0.tpCuarto = false
			$Timer.start()

func teletransporte():
	Status0.minVisible = false
	player.global_position = edificio

func _on_body_entered(body):
	dentro = true

func _on_body_exited(body):
	dentro = false

func _on_timer_timeout():
	Status0.tpCuarto = true
