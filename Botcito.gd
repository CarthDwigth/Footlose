extends CharacterBody2D

var speed = 300

func _process(delta):
	velocity.x = speed
	move_and_slide()
