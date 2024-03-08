extends Sprite2D

@export var speed = 400
@export var min_interval_sec_bw_fire = 0.2
signal shoot



var screen_size
var last_fire_time

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var velocity = Vector2.ZERO
	if(Input.is_action_pressed("ui_left")):
		velocity.x = -1
		
	if(Input.is_action_pressed("ui_right")):
		velocity.x += 1;
		
	if(Input.is_action_pressed("ui_up")):
		fire()
		pass
	
	position += velocity * speed * delta
	position = position.clamp(Vector2.ZERO, screen_size)
			

func fire():
	var current_time = Time.get_unix_time_from_system()
	if last_fire_time == null:
		last_fire_time = current_time
		shoot.emit()
	else:
		var diff = current_time - last_fire_time
		# .2 second is 
		if(diff > min_interval_sec_bw_fire):
			last_fire_time = current_time;
			shoot.emit()	
	
