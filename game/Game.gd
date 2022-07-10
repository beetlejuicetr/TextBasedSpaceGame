extends Control



onready var eventTr = preload("res://game/event_trigger.gd")
func _ready():

	EventTrigger._prepare()
	
	
	$map_panel.visible = false
	$ship_panel.visible = false
	$market_panel.visible = false
	$HBoxContainer/ship_btn.text = tr("gm1")
	$HBoxContainer/map_btn.text = tr("gm2")
	$HBoxContainer/market_btn.text = tr("gm3")
	
	
	pass 


func _on_ship_btn_pressed():
	$ship_panel.visible = !$ship_panel.visible
	$ship_panel/durum.text = ""
	$map_panel.visible = false
	$market_panel.visible = false
	pass 

func _on_map_btn_pressed():
	$ship_panel.visible =false
	
	$map_panel.visible = !$map_panel.visible
	$market_panel.visible = false
	pass # Replace with function body.




func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
	
		$gecis_efekti._sahneye_git("res://menu/Menu.tscn")
	pass


func _on_market_btn_pressed():
	$market_panel.visible = !$market_panel.visible
	$ship_panel.visible =false
	$map_panel.visible = false
	pass # Replace with function body.
