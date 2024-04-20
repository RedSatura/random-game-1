extends StaticBody2D

enum CountertopState {
	EMPTY,
	FILLED,
}

var countertop_state = CountertopState.EMPTY

func _ready():
	GameEventBus.connect("oven_ready", Callable(self, "oven_ready"))
	countertop_state = CountertopState.EMPTY

func _process(_delta):
	pass

func oven_ready():
	pass
