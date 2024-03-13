extends CharacterBody2D
#1
@export var Start:Marker2D
@export var End:Marker2D
@export var Spawn:Marker2D
@export var Player:CharacterBody2D
@export var Dialogo:DialogueResource
@onready var AnimaPlay = $AnimatedSprite2D
var speed = 100
var destino:Vector2
var ubicacionPlayer:Vector2
var verbalase = false
var muevete = true

func _ready():
	$Label.visible = false
	global_position = Start.global_position
	destino = End.global_position

func _process(delta):
	if verbalase == true:
		destino = Player.global_position
	if muevete == true:
		moverse()

func moverse():
	var direction = (destino - global_position).normalized()	
	var distance = global_position.distance_to(destino)
	if distance > 1:
		velocity= direction *speed
		move_and_slide()
	else:
		velocity = Vector2.ZERO
		destino = Start.global_position
		
	animaciones(direction)

func animaciones(direction: Vector2):
	if direction.x > 0:
		AnimaPlay.flip_h = true
		AnimaPlay.play("left")
	elif direction.x < 0:
		AnimaPlay.flip_h = false
		AnimaPlay.play("left")
	elif direction.y > 0:
		AnimaPlay.play("down")
	elif direction.y < 0:
		AnimaPlay.play("up")

func _on_area_2d_body_entered(body):
	verbalase = true
	speed = 200
	$Label.visible = true

func _on_area_2d_body_exited(body):
	verbalase = false
	speed = 100
	destino = End.global_position
	$Label.visible = false

func _on_area_robo_body_entered(body):
	var InicioDialogo:String = "robo"
	Status0.Robado = true
	muevete = false
	DialogueManager.show_dialogue_balloon(Dialogo, InicioDialogo)

func _on_mundo_robo():
	position = Spawn.global_position
	muevete = true
