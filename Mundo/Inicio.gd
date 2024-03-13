extends Node2D

@export var Mundo = "res://Mundo/Mundo.tscn"
@export var dialogo:DialogueResource
@onready var Audio = $AudioStreamPlayer2D
var start:String = "start"
@onready var animacion = $ColorRect/AnimationPlayer
# Called when the node enters the scene tree for the first time.

func _ready():
	DialogueManager.show_dialogue_balloon(dialogo, start)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Status0.cinematica == true:
		animacion.play("fade")

func _on_audio_stream_player_2d_finished():
	Audio.play()

func _on_animation_player_animation_finished(fade):
	get_tree().change_scene_to_file(Mundo)
