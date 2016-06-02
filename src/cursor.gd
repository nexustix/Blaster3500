
extends Sprite

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	self.set_process(true)
	pass
	
func _process(delta):
	self.set_pos(get_global_mouse_pos())


