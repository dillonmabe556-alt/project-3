extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	# Check if the object entering the spikes is the player
	if body.name == "player":
		# Reloads the entire level
		get_tree().reload_current_scene() 
