extends CharacterBody2D

@export var SPEED = 200
@onready var muzzle = $Gun/Muzzle
@onready var camera = $Camera2D

func _ready():
	pass
	
func _physics_process(_delta):
	if Input.is_action_just_pressed("shoot"):
		var bullet_inst = preload("res://scenes/bullet.tscn").instantiate()
		bullet_inst.global_position = self.global_position
		bullet_inst.transform = muzzle.global_transform
		owner.add_child(bullet_inst)
	
	look_at(get_global_mouse_position())
	move_and_slide()
	
func _unhandled_input(_event):
	if Input.is_action_just_released("zoom_out"):
		if camera.zoom.x > 0.8 && camera.zoom.y > 0.8:
			camera.zoom = Vector2(camera.zoom.x - 0.1, camera.zoom.y - 0.1)
	elif Input.is_action_just_released("zoom_in"):
		if camera.zoom.x < 2 && camera.zoom.y < 2:
			camera.zoom = Vector2(camera.zoom.x + 0.1, camera.zoom.y + 0.1)
			
	velocity.x = Input.get_axis("move_left", "move_right")
	velocity.y = Input.get_axis("move_up", "move_down")
	
	velocity = velocity.normalized()
	
	velocity *= SPEED
