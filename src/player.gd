
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar

var angMouse = 0
var angShip = 0
var degTest = 0
var uno = 0
var speed = 1

var isSlipstreaming = false
var isEngineForwardOn = false

var slip
var eng
var bang

func _ready():
	
	self.set_gravity_scale(0)
	
	bang = find_node("SlipstreamBang")
	slip = find_node("SlipstreamParticles")
	eng = find_node("MainEngineParticles")
	
	set_process(true)


func _process(delta):
	
	angMouse = self.get_pos().angle_to_point(get_global_mouse_pos())
	
	angShip = self.get_rot()
	
	uno = atan2(sin(angShip-angMouse), cos(angShip-angMouse ))

	if (!isSlipstreaming):
		self.set_angular_velocity(uno)
		self.set_linear_damp(-1)
		slip.set_emitting(false)
		slip.reset()

		pass
	else:
		self.set_linear_damp(0)
		self.set_angular_velocity(0)
		slip.set_emitting(true)

	var vely = -(cos(angShip))
	var velx = -(sin(angShip))
	
	#DEBUG
	#print(velx)
	#print(vely)
	#print(angShip)
	
	
	#FIXME use intended feature instead
	if Input.is_key_pressed(KEY_W):
		
		velx *= speed
		vely *= speed

		self.set_linear_velocity(self.get_linear_velocity()+Vector2(velx,vely))
		eng.set_emitting(true)
		if(isSlipstreaming):
			bang.set_emitting(true)
			self.set_linear_damp(100)
			self.set_linear_velocity(Vector2(0,0))
			isSlipstreaming = false	
		
	else:
		if(!isSlipstreaming):
			eng.set_emitting(false)
		else:
			eng.set_emitting(true)
		
	if Input.is_key_pressed(KEY_Q):
		
		velx *= 1000
		vely *= 1000
		
		self.set_angular_velocity(0)
		
		bang.set_emitting(true)

		self.set_linear_velocity(Vector2(velx,vely))
		self.set_linear_damp(0)
		
		isSlipstreaming = true

	pass

	
	
		

func _draw():
	#draw_circle(Vector2(0,0), 50, Color(0,0.5,0, 0.4))
	pass


