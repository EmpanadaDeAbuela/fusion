extends Control

func _ready() -> void:
	setValues()

func setValues():
	$HBoxContainer/muisc.value = SoundEffectManager.musicValue
	$HBoxContainer/sfx.value = SoundEffectManager.sfxValue
	
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _on_muisc_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value / 10.0))
	SoundEffectManager.musicValue = value

func _on_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(value / 10.0))
	SoundEffectManager.sfxValue = value
