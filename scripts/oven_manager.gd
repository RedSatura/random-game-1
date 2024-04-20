extends Node2D

var active_orders = 0

@onready var oven1 = $Oven
@onready var oven2 = $Oven2
@onready var oven3 = $Oven3
@onready var oven4 = $Oven4

func _ready():
	GameEventBus.connect("new_order", Callable(self, "new_order"))

func _process(_delta):
	pass
	
func new_order():
	active_orders += 1
