extends Node
@export var player_ship_rocket : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_ship_shoot():
	var rocket = player_ship_rocket.instantiate()
	rocket.position = $PlayerShip.position
	add_child(rocket)
	
