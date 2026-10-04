extends Area2D

@onready var win = $"../UI whatever/Label"
@onready var timer: Timer = $Timer

func _ready() -> void:
	win.visible = false

func _on_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.play("open")
	$ZeldaAllItemGetJingles19862017.play()
	$CollisionShape2D.queue_free()
	win.visible = true
	timer.start()
	
func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
