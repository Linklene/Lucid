extends KinematicBody2D

const SPEED=200
const ACCELERATION=40



var motion = Vector2()

func _physics_process(delta):
	var right= int(Input.is_action_pressed("ui_right"))
	var left= -1*int(Input.is_action_pressed("ui_left"))
	var up= -1*int(Input.is_action_pressed("ui_up"))
	var down= int(Input.is_action_pressed("ui_down"))
	
	
	#movement
	#---------------------------------------------------
	if abs(motion.x) > SPEED:
		motion.x=(right+left)*SPEED
	else:
		motion.x= motion.x + ACCELERATION*(right +left)
	if (right==0 and left==0) or right+left==0:
		motion.x=lerp(motion.x,0,0.5)
		
	if abs(motion.y) > SPEED:
		motion.y=(up+down)*SPEED
	else:
		motion.y=motion.y+ACCELERATION*(up +down)
	if (up==0 and down==0) or up+down==0:
		motion.y=lerp(motion.y,0,0.5)
	
	motion = move_and_slide(motion)
	
	
	
	
	pass
	
	