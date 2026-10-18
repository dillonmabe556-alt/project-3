extends Area2D

@export var destination_node: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_body_entered(body: Node2D) -> void:
	print("is working")
	if body.is_in_group("player"):
		print("The group check passed! Teleporting now.")
		body.global_position = destination_node.global_position
