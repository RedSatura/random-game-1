extends StaticBody2D

@onready var oven_info = $OvenInfo
@onready var oven_info_bar = $OvenInfo/ProgressBar
@onready var oven_info_label = $OvenInfo/Label

var preparation_progress = 0
var cooking_progress = 0

enum OvenState {
	IDLE,
	PREPARING,
	COOKING,
	READY,
}

var oven_state = OvenState.IDLE

func _ready():
	GameEventBus.connect("time_advanced", Callable(self, "time_advanced"))
	GameEventBus.connect("new_order", Callable(self, "new_order"))
	oven_state = OvenState.IDLE
	
func _on_bullet_detector_area_entered(_area):
	if oven_state == OvenState.IDLE:
		if get_parent().active_orders > 0:
			oven_state = OvenState.PREPARING
			get_parent().active_orders -= 1
	elif oven_state == OvenState.PREPARING:
		oven_info.visible = true
		oven_info_bar.visible = true
		oven_info_label.text = "Preparing..."
		preparation_progress += 5
		oven_info_bar.value = preparation_progress
		if preparation_progress >= 100:
			preparation_progress = 0
			oven_info_label.text = "Cooking..."
			oven_state = OvenState.COOKING
			oven_info_bar.value = cooking_progress
			return
	elif OvenState.COOKING:
		pass
	elif OvenState.READY:
		pass
		
func time_advanced():
	if oven_state == OvenState.COOKING:
		cooking_progress += 5
		oven_info_bar.value = cooking_progress
		if cooking_progress >= 100:
			oven_info_label.text = "Ready!"
			cooking_progress = 0
			oven_state = OvenState.READY
			oven_info_bar.visible = false
	elif oven_state == OvenState.READY:
		oven_state = OvenState.IDLE
		oven_info.visible = false
		GameEventBus.emit_signal("oven_ready")
		
func new_order():
	pass
