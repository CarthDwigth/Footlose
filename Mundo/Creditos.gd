extends Node2D

@onready var Botellas = $CanvasLayer/Label
@onready var Dinero = $CanvasLayer/Label2
@onready var Pescado = $CanvasLayer/Label3

func _ready():
	Botellas.text = "Collected recyclables: "+ str(Status0.BotellasTo)
	Dinero.text = "Total Money: "+ str(Status0.Moneyto)
	Pescado.text = "Total Fish: "+ str(Status0.pescadosTo)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	get_tree().quit()
