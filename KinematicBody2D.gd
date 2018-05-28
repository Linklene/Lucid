extends KinematicBody2D

const SPEED=200
const JUMP=400
const ACCELERATION=30



var motion = Vector2()
var friction =false

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x=min(motion.x+ACCELERATION,SPEED)
		$Sprite.flip_h=false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		if is_on_floor():
			motion.x=max(motion.x-ACCELERATION,-SPEED)
		else:
			motion.x=max(motion.x-ACCELERATION/5,-SPEED)
		$Sprite.flip_h=true
		$Sprite.play("Run")
	else:
		$Sprite.play("Idle")
		friction=true
		motion.x=lerp(motion.x,0, 0.2)
	if Input.is_action_pressed("ui_down"):
		motion.y=min(motion.x+ACCELERATION,SPEED)
		$Sprite.flip_v =false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_up"):
		motion.y=max(motion.x-ACCELERATION,-SPEED)
		$Sprite.flip_v=true
		$Sprite.play("Run")
	else:
		$Sprite.play("Idle")
		friction=true
		motion.x=lerp(motion.x,0, 0.2)
		
	motion = move_and_slide(motion)
	
	pass
	
	