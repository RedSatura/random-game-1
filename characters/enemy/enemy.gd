extends CharacterBody2D

@export var health = 100:
	set(value):
		health = value

@onready var healthbar = $HealthBar
@onready var notif = $Notif

enum CustomerState {
	MOVING,
	ORDERING,
	WAITING,
	EATING,
}

var customer_state = CustomerState.ORDERING

func _ready():
	customer_state = CustomerState.ORDERING
	
func _process(_delta):
	pass
	
func _on_hitbox_area_entered(area):
	if "damage" in area:
		health -= area.damage
		
	if customer_state == CustomerState.MOVING:
		pass
	elif customer_state == CustomerState.ORDERING:
		GameEventBus.emit_signal("new_order")
		notif.visible = false
		customer_state = CustomerState.WAITING
