extends Node

@onready var button_audio = $ButtonAudio
@onready var menu_music = $"MenuMusic"

func _on_game_start_pressed():
	button_audio.play()
	get_tree().change_scene_to_file("res://Scenes/Level_1/level_1.tscn")
