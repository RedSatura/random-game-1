extends CharacterBody2D

@export var SPEED = 200

func _ready():
	pass
	
func _physics_process(_delta):
	move_and_slide()
	
func _unhandled_input(_event):
	velocity.x = Input.get_axis("move_left", "move_right")
	velocity.y = Input.get_axis("move_up", "move_down")
	
	velocity = velocity.normalized()
	
	velocity *= SPEED
