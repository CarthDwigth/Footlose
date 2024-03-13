extends CharacterBody2D

@export var dialogo:DialogueResource
var dentro = false
var hablado = false

func _process(delta):
	if Input.is_action_pressed("Shift-L") and dentro == true:
		if !hablado:
			charlita()
			hablado = true
		else:
			if Status0.Botellas > 0:
				charlota()

func charlita():
	var start = "start"
	DialogueManager.show_dialogue_balloon(dialogo, start)

func charlota():
	var start = "canready"
	print("asd")
	DialogueManager.show_dialogue_balloon(dialogo, start)
	Status0.Botellas *= 9
	Status0.Money += Status0.Botellas 
	Status0.Moneyto += Status0.Botellas
	Status0.Botellas = 0
	
func _on_area_2d_body_entered(body):
	dentro = true
	Status0.mostrarshift = true

func _on_area_2d_body_exited(body):
	dentro = false
	Status0.mostrarshift = false
