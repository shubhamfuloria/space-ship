extends Node
@export var player_ship_rocket : PackedScene
@export var alien_rocket : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$AlienTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_ship_shoot():
	var rocket : RigidBody2D = player_ship_rocket.instantiate()
	rocket.position = $PlayerShip.position
	add_child(rocket)


func _on_alien_timer_timeout():
	var alien = alien_rocket.instantiate()

	var rand_location = randi() % (300 - 50 + 1) + 50
	alien.position = Vector2(rand_location, 0)
	add_child(alien)
