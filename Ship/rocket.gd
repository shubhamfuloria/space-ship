extends Area2D

var screen_size;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = Vector2(position.x, position.y - 10)

func set_initial_position(position_):
	position = position_


func _on_visible_on_screen_notifier_2d_screen_exited():
	# rocket has left the screen
	queue_free()
	
