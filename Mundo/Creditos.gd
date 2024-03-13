extends Node2D

@onready var Botellas = $CanvasLayer/Label

func _ready():
	Botellas.text = "Collected recyclables: "+ str(Status0.BotellasTo)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	get_tree().quit()
