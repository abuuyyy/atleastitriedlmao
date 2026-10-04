extends Area2D

@onready var retry = $"../UI whatever/retry"
@onready var back = $"../UI whatever/back"
@onready var ded = $"../UI whatever/you ded"

func _ready() -> void:
	retry.visible = false
	back.visible = false
	ded.visible = false

func _on_body_entered(body: Node2D) -> void:
	retry.visible = true
	back.visible = true
	ded.visible= true
	get_tree().paused = true
