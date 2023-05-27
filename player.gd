extends CharacterBody2D


var facing_right = true

@export var move_speed = 250

@onready var anim_player = $Graphics/AnimationPlayer


func _physics_process(_delta):
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized() * move_speed
	move_and_slide()
	
	if facing_right and velocity.x < 0:
		flip()
	elif !facing_right and velocity.x > 0:
		flip()
	
	if velocity == Vector2.ZERO:
		anim_player.play("idle")
	else:
		anim_player.play("walk")


func flip():
	$Graphics.scale.x *= -1
	facing_right = !facing_right
