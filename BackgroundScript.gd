extends ParallaxBackground

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var offsetLocation = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	offsetLocation = offsetLocation + (150 * delta)
	set_scroll_offset(Vector2(0, offsetLocation))