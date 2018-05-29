
extends KinematicBody2D
const SPEED=400     #Egos Speed
const DISTANCE=200 #Distance Ego can Move from Lucy

var possesion = 1  #turns 0 if possesing an object
var target = Vector2()
func _physics_process(delta):
	var pos_lucy=get_node("../Lucy").position
	var pos_ego=$".".position
	var dist_ego_lucy =sqrt(pow(pos_lucy.x-pos_ego.x,2)+pow(pos_lucy.y-pos_ego.y,2))
	
	if  dist_ego_lucy*possesion <= DISTANCE:    #check for max dist. with possesion switch
		if Input.is_action_pressed("ui_leftclick"):    #mouse has to be clicked to continue moving
			target=get_global_mouse_position()
		
		if target==pos_lucy:
			target=pos_ego
			
			
	elif dist_ego_lucy*possesion > DISTANCE+ 5:
			target=pos_lucy
	print(target)
	if (target-pos_ego).length() >5:
		move_and_slide(SPEED*(target - pos_ego).normalized())
