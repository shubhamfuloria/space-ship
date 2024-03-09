extends RigidBody2D

var screen_size;
var shoot_sound = preload("res://Ship/assets/shoot.mp3")
# Called when the node enters the scene tree for the first time.
func _ready():
	$ShootSound.play()
	connect("body_entered", destroy)
	$DestroyAnimation.play("normal")
	add_constant_force(Vector2(0, -300))	


	
func destroy(body):
	$DestroyAnimation.play('destroy')
	constant_force = Vector2(0, 1000)
	$AnimationFinishedTimer.start()
	$DestroySound.play()
	body.queue_free()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#position = Vector2(position.x, position.y - 10)

func set_initial_position(position_):
	position = position_


func _on_visible_on_screen_notifier_2d_screen_exited():
	# rocket has left the screen
	queue_free()
	


func _on_animation_finished_timer_timeout():
	hide()
	queue_free();
