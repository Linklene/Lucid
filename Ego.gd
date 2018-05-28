extends KinematicBody2D
const SPEED=10
func _physics_process(delta):
	if Input.is_action_pressed("ui_leftclick"):    #moves Ego where mouse is clicked
 		move_and_slide(SPEED*(get_global_mouse_position() - $".".position))