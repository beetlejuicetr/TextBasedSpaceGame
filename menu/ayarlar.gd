extends Control

func _ready():
	$VBoxContainer/HSlider.value = GlobalData.settings["ses_ayari"]
	$VBoxContainer/ses_duzey.text = "%"+str(GlobalData.settings["ses_ayari"])
	pass




func _on_HSlider_value_changed(value):
	GlobalData.settings["ses_ayari"] = value
	$VBoxContainer/ses_duzey.text = "%"+str(GlobalData.settings["ses_ayari"])
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("ui_select"):
		$gecis_efekti._sahneye_git("res://menu/Menu.tscn")
		pass
	pass
