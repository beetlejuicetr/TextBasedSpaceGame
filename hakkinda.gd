extends Control


func _input(event):
	if Input.is_action_just_pressed("ui_select"):
		$gecis_efekti._sahneye_git("res://menu/Menu.tscn")
		pass
