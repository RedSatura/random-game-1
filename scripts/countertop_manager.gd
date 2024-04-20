extends Node2D

@onready var countertop1 = $MarbleCountertop
@onready var countertop2 = $MarbleCountertop2
@onready var countertop3 = $MarbleCountertop3
@onready var countertop4 = $MarbleCountertop4

func _ready():
	GameEventBus.connect("oven_ready", Callable(self, "oven_ready"))
	
func oven_ready():
	pass
