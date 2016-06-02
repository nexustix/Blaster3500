
extends RichTextLabel

# member variables here, example:
# var a=2
# var b="textvar"

var player
var camera

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#var cord = find_node("Player", true, true)
	
	#add_text(str(self.get_pos().x, self.get_pos().y))
	#add_text("test")
	
	#add_text(str(cord.get_pos().x, cord.get_pos().y))
	player = get_node("../../Player") 
	camera = get_node("../../Player/Camera2D") 
	#self.set_pos( parent.get_pos())
	add_text("cake")
	set_process(true)
	pass

func _fixed_process(delta):
	#self.set_pos( player.get_pos()-Vector2(-1,-1))
	pass

func _process(delta):
	#self.set_pos( player.get_pos()-Vector2(-1,-1))
	
	clear()
	add_text(str("X: ",round(player.get_pos().x),"\nY: ",round(player.get_pos().y)))
	pass


