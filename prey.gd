extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var target = position
var isClickingObject = false
var localTarget = null
func _input(event):
   # Mouse in viewport coordinates
	if event is InputEventMouseButton:
		if event.pressed:
			isClickingObject = false
			localTarget = get_global_mouse_position()
			print((localTarget-position).length())
			if (localTarget-position).length() < 50: 
				isClickingObject = true
		if not event.pressed && isClickingObject:
			target = get_global_mouse_position()

func _physics_process(delta):
	velocity = (target - position).normalized() * speed
	if (target - position).length() > 5:
        velocity = move_and_slide(velocity)
		