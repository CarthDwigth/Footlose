extends Node2D

var dentro = false
@onready var pez = $AnimatedSprite2D
@onready var pez2 = $AnimatedSprite2D2
@onready var pez3 = $AnimatedSprite2D3
@onready var pez1 = $AnimatedSprite2D
var peces:Array

var jugando = false

func _ready():
	pass
	
func _process(delta):
	if Status0.fish == true:
		comproba()
		if Input.is_action_pressed("Shift-L") and  dentro and !jugando:
			inicarJuego()

func numeroRandom():
	var aleatoriador = randi() % 3
	if aleatoriador == 0:
		pez = pez1
	elif aleatoriador == 1:
		pez = pez2
	else:
		pez = pez3
	return randi() % 3
	
func inicarJuego():
	print("ADS")
	$Timer.start()
	jugando = true
	if numeroRandom() == 1:
		pez.visible = true
	else:
		pez.visible = false
	
func _on_area_2d_body_entered(body):
	dentro = true

func _on_area_2d_body_exited(body):
	dentro = false
	jugando = false
	$Timer.stop()

func _input(event):
	if event.is_action_pressed("e"):
		if pez.visible == true:
			capturar_pez()
			
func capturar_pez():
	Status0.pescados += 1
	pez.visible = false

func comproba():
	if pez.visible:
		Status0.mostrarE = true
	else:
		Status0.mostrarE = false

func _on_timer_timeout():
	inicarJuego()
