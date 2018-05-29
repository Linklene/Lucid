extends KinematicBody2D
const SPEED=10     #Egos Speed
const DISTANCE=200 #Distance Ego can Move from Lucy

var possesion = 1  #turns 0 if possesing an object
#print(get_node("../Lucy").position)



func _physics_process(delta):
	var pos_lucy=get_node("../Lucy").position
	var pos_ego=$".".position
	var dist_ego_lucy =sqrt(pow(pos_lucy.x-pos_ego.x,2)+pow(pos_lucy.y-pos_ego.y,2))
	
	
	if  dist_ego_lucy*possesion < DISTANCE:    #always true if possesed is true
		if Input.is_action_pressed("ui_leftclick"):    #moves Ego where mouse is clicked
 			move_and_slide(SPEED*(get_global_mouse_position() - pos_ego))
	else:
			move_and_slide((pos_lucy - pos_ego))
		
	