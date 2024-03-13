extends Node2D

@onready var animacion1 = $Vaso1/AnimacionVaso
@onready var animacion2 = $Vaso2/AnimacionVaso2
@onready var animacion3 = $Vaso3/AnimacionVaso3
# Called when the node enters the scene tree for the first time.

func _ready():
	animacion1.play("Movida")
	animacion2.play("Movida")
	animacion3.play("Movida")
