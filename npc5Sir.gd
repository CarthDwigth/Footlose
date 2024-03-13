extends CharacterBody2D

var dentro = false
@export var dialogo:DialogueResource 
var wins = 0
var start = "start"

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("Shift-L") and dentro == true:
		if Status0.Jogado == false:
			Status0.Jogado = true
			DialogueManager.show_dialogue_balloon(dialogo, start)

func _on_area_2d_body_entered(body):
	dentro = true
	Status0.mostrarshift = true
	
func _on_area_2d_body_exited(body):
	dentro = false
	Status0.mostrarshift = false
