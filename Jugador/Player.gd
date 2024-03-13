extends CharacterBody2D

@onready var animaciones = $AnimationPlayer
@onready var sprite = $Sprite2D
const speed:int = 450
var muevete = true

func _physics_process(delta):
	if muevete == true:
		var direction = Input.get_vector( "ui_left", "ui_right", "ui_up", "ui_down")
		if direction:
			velocity = direction * speed
		else:
			velocity = Vector2.ZERO
		animacion()
		move_and_slide()
	isrob()
	
func animacion():
	if velocity.x > 0:
		sprite.flip_h = false
		animaciones.play("walk_right")
	
	if velocity.x < 0:
		sprite.flip_h = true
		animaciones.play("walk_right")
	
	if velocity.y > 0:
		animaciones.play("walk_down")
		
	if velocity.y < 0:
		animaciones.play("walk_up")
	
func isrob():
	if Status0.talking == true:
		muevete = false
	else:
		if Status0.Robado == true:
			muevete = false
		else:
			muevete = true
