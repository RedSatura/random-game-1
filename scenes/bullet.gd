extends Area2D

@export var speed = 500

func _ready():
	pass # Replace with function body.

func _process(delta):
	position += transform.x * speed * delta

func _on_body_entered(_body):
	queue_free()

