extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var target = position
var isClickingObject = false
var localTarget = null
var walking = true
var running = false
var dead = false
onready var preySprite = get_node("PreySprite")

func _input(event):
   # Mouse in viewport coordinates
	if event is InputEventMouseButton:
		if event.pressed:
			isClickingObject = false
			localTarget = get_global_mouse_position()
			if (localTarget-position).length() < 50: 
				isClickingObject = true
		if not event.pressed && isClickingObject:
			target = get_global_mouse_position()
			

func _physics_process(delta):
	velocity = (target - position).normalized() * speed
	if (target - position).length() > 5:
		velocity = move_and_slide(velocity)
		walking = false
		running = true
	else:
		walking = true
		running = false
		
	if walking:
		preySprite.play("walk")
	if running:
		preySprite.play("run")
	if dead: 
		preySprite.play("dead")
		