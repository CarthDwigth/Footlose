extends Node2D

@onready var Audio = $AudioStreamPlayer
@onready var minimapa = $CanvasLayer
@onready var MoneyLabel:Label = $CanvasLayer/Money
@onready var Minimapa = $CanvasLayer/Minimapa
@onready var poly = $CanvasLayer/Polygon2D
@onready var E = $CanvasLayer/E
@onready var Shift = $CanvasLayer/Shift
@onready var pointer = $CanvasLayer/Minimapa/Sprite2D
@onready var mision = $CanvasLayer/MisionLabel
@onready var audio = $AudioStreamPlayer
@onready var botella = $CanvasLayer/Botellas
@onready var botellaSpr = $CanvasLayer/Botellas/AnimatedSprite2D
@onready var pescado = $CanvasLayer/Pescados
@onready var pescadoSpr = $CanvasLayer/Pescados/AnimatedSprite2D

signal robo
var robado = false

# NO TOCAR
func _ready():
	Minimapa.visible = false
	poly.visible = false
	E.visible = false
	Shift.visible = false
	botella.visible = false
	botellaSpr.visible = false
	pescado.visible = false
	pescadoSpr.visible = false

func _process(delta):
	if Status0.Go == true:
		get_tree().change_scene_to_file("res://Mundo/Creditos.tscn")
	if Status0.minVisible == true:
		Minimapa.visible = true
		poly.visible = true
		pointer.visible = true
		mision.visible = true
	else:
		Minimapa.visible = false
		poly.visible = false
		pointer.visible = false
		mision.visible = false
	ActualizarDinero()
	Robo()
	MostrarE()
	MostrarShift()
	misiones()
	ActualizarBotellas()
	ActualizarPescados()

func ActualizarDinero():
	MoneyLabel.text = str(Status0.Money)+" $"

func Robo():
	if Status0.Op == "2" and robado == false:
		print("asdad")
		var lucky = randf()
		if lucky < 0.5:
			Status0.Money /=2
		else:
			Status0.Money -= Status0.Money / 4
		robado = true
		emit_signal("robo")
	else: 
		if Status0.Op == "1" and robado == false:
			print("asd")
			Status0.Money -= Status0.Dinerorobado
			Status0.Dinerorobado = Status0.Dinerorobado * 2
			robado = true
			Status0.Op = ""
			emit_signal("robo")
		
func _on_robo():
	Status0.Op = ""
	robado = false

func MostrarE():
	if Status0.mostrarE == true:
		E.visible = true
	else:
		E.visible = false
		
func MostrarShift():
	if Status0.mostrarshift == true:
		Shift.visible = true
	else:
		Shift.visible = false

func misiones():
	if Status0.falado == true:
		mision.text = "Talk to people in business to get some income"

func _on_audio_stream_player_finished():
	audio.play()

func ActualizarPescados():
	if Status0.fish:
		pescado.visible = true
		pescadoSpr.visible = true
	pescado.text= str(Status0.pescados)
	
func ActualizarBotellas():
	if Status0.Botellas == 1:
		botella.visible = true
		botellaSpr.visible = true
	botella.text = str(Status0.Botellas)
