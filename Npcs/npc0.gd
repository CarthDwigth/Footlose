extends CharacterBody2D

#Dialogos
@export var dialogo: DialogueResource
@export var inicioDialogo: String = "start"
var hablado = false
var jugadorDentro:bool = false

#Si el jugador esta dentro y se presiona shift Left el dialogo se ahce visible
func _process(delta):
	if Status0.talking == false:
		if Input.is_action_just_pressed("Shift-L") and jugadorDentro == true:
			if !hablado: 
				DialogueManager.show_dialogue_balloon(dialogo, inicioDialogo)
				hablado = true
			else:
				DialogueManager.show_dialogue_balloon(dialogo, Status0.talk_status)
			
func _on_area_2d_body_entered(body):
	print("oi")
	jugadorDentro = true
	Status0.mostrarshift = true

func _on_area_2d_body_exited(body):
	jugadorDentro = false
	Status0.mostrarshift = false
