extends CharacterBody2D

@export var dialogo:DialogueResource
var dentro = false
var hablado = false

func _physics_process(delta):
	if Input.is_action_pressed("Shift-L") and dentro == true:
		if !hablado:
			dialogou()
			hablado = true
		else:
			if Status0.ComidaDoom == true:
				dialogod()

func dialogou():
	var start:String = "start"
	DialogueManager.show_dialogue_balloon(dialogo, start)

func dialogod():
	var start = Status0.DoomStatus
	DialogueManager.show_dialogue_balloon(dialogo, start)
	Status0.Money += 80
	Status0.Moneyto += 80
	Status0.ComidaDoom = false

func _on_area_2d_body_entered(body):
	dentro = true
	Status0.mostrarshift = true

func _on_area_2d_body_exited(body):
	dentro = false
	Status0.mostrarshift = false
