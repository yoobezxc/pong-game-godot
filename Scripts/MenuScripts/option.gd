extends Node2D

@onready var music_slider: HSlider = $UI/MarginContainer/VBoxContainer/GridContainer/MusicSlider
@onready var sfx_slider: HSlider = $UI/MarginContainer/VBoxContainer/GridContainer/SFXSlider

func _ready():
	music_slider.value = Global.music_volume
	sfx_slider.value = Global.sfx_volume

func _on_back_button_pressed() -> void:
	Global.load_scene(Global.main_menu)

func _on_music_slider_value_changed(value: float) -> void:
	Global.set_music_volume(value)

func _on_sfx_slider_value_changed(value: float) -> void:
	Global.set_sfx_volume(value)
