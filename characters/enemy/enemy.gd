extends CharacterBody2D

@export var health = 100:
	set(value):
		health = value

@onready var healthbar = $HealthBar

func _ready():
	pass
	
func _process(_delta):
	pass
	
func _on_hitbox_area_entered(area):
	if area.damage:
		health -= area.damage
