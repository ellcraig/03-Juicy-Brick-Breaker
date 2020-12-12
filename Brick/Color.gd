extends ColorRect

onready var HUD = get_node("/root/Game/HUD")
var c = 0

var colors = [
	Color8(18,230,10)		#green
	,Color8(255,255,11)		#yellow
	,Color8(255,11,11)		#red
	,Color8(199,60,209)		#pink
]

func _ready():
	HUD.connect("changed",self,"_on_HUD_changed")
	update_color()


func update_color():
	if HUD.color_background:
		$Tween.interpolate_property(self, "color", color, colors[c], $Timer.wait_time-0.01, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		$Tween.start()
	else:
		color = Color(0,0,0,1)

func _on_HUD_changed():
	update_color()


func _on_Timer_timeout():
	if HUD.color_background:
		c += 1
		c %= colors.size()
		update_color()



