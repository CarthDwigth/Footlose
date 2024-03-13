extends Area2D

var dentro = false
@export var dialogo:DialogueResource

func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("Shift-L") and dentro == true:
		texto()

func texto():
	if Status0.talking == false:
		var start:String = "start"
		DialogueManager.show_dialogue_balloon(dialogo, start)

func _on_body_entered(body):
	dentro = true

func _on_body_exited(body):
	dentro = false
