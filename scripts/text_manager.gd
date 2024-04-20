extends Panel

var day: int = 1
var hour: int = 6
var minute: int = 0
var money: float = 0

@onready var player_info = $PlayerInfo

func _ready():
	GameEventBus.connect("time_advanced", Callable(self, "time_advanced"))
	player_info.text = "Day %d\n%02d : %02d\n$ %d" % [day, hour, minute, money]

func update_label():
	player_info.text = "Day %d\n%02d : %02d\n$ %d" % [day, hour, minute, money]

func time_advanced():
	minute += 5
	if minute >= 60:
		hour += 1
		minute = 0
	if hour >= 16:
		pass
	
	update_label()
