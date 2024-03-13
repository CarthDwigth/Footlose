extends CharacterBody2D

var dentro = false
@export var dialogo:DialogueResource
@onready var char = $AnimatedSprite2D
var hablado = true
var vendido = false

func _ready():
	char.flip_h = true

func _process(delta):
	var start:String = "start"
	if Input.is_action_pressed("Shift-L") and dentro:
		if Status0.fish == false and hablado:
			DialogueManager.show_dialogue_balloon(dialogo, start)
			hablado = false
		else:
			if vendido == false:
				var diag:String = "comprar"
				DialogueManager.show_dialogue_balloon(dialogo, diag)
				Status0.pescados *= 15
				Status0.Money += Status0.pescados 
				Status0.Moneyto += Status0.pescados
				Status0.pescados = 0
				vendido = true

func _on_area_2d_body_entered(body):
	dentro = true
	Status0.mostrarshift = true

func _on_area_2d_body_exited(body):
	dentro = false
	Status0.mostrarshift = false
	vendido = false
