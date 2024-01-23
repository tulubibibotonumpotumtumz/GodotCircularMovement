extends Sprite2D
#Sprite's position used as a center relative to the mouse position
var Px = 0
var Py = 0
var launched = false
var tex = preload("res://icon.svg")
#following variables
@onready var following = get_node("../following")
#offset to replace sprite
var sprite_offset = PI/2
var projectile = Sprite2D.new()
#window variables
var win_size
var screen_width
var screen_height

# Called when the node enters the scene tree for the first time.
func _ready():
	
	win_size = get_viewport().content_scale_size
	screen_width = win_size[0]
	screen_height = win_size[1]
	Px = screen_width/2
	Py = screen_height/2
	self.position.x  = Px
	self.position.y = Py
	following.position.x = Px
	following.position.y = Py
	print(screen_width, " ", screen_height)
	projectile.set_texture(tex)
	

func shoot():
	#projectile
	pass

#mouse variables
var mouse_pos
var mouse_x
var mouse_y

#adjusted global coordinates relative the Sprite's center
var new_coord = [0, 0]
var dist_center = 1
var coef = 200#makes the unit circle's radius bigger
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_pos = get_viewport().get_mouse_position()
	mouse_x = mouse_pos[0]-Px
	mouse_y = Py-mouse_pos[1]
	#print(mouse_x, " ", mouse_y)
	#computes the x and y coordinate
	dist_center = max(1, sqrt(mouse_x**2 + mouse_y**2)) #thanks Pythagora :)
	following.position.x = Px+(coef*mouse_x/dist_center)
	following.position.y = Py-(coef*mouse_y/dist_center)
	if mouse_y < 0:
		following.rotation = 2*PI - (acos((mouse_y**2 - mouse_x**2 - dist_center**2)/(2*dist_center*(mouse_x if mouse_x != 0 else 1)))+sprite_offset)
	else:
		following.rotation = acos((mouse_y**2 - mouse_x**2 - dist_center**2)/(2*dist_center*(mouse_x if mouse_x != 0 else 1))) - sprite_offset
	
	#instanciation of projectiles
	if Input.is_action_just_pressed("ui_accept") and not launched:
		launched = true
		print("Hey")
		add_child(projectile)
		projectile.position.x = Px+100
		projectile.position.y = Py+100
		shoot()
	
	
