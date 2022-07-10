extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/VBoxContainer/oyna.text = tr("mn1")
	$Panel/VBoxContainer/hakkinda.text = tr("mn3")
	$Panel/VBoxContainer/ayarlar.text  = tr("mn2")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_oyna_pressed():

	$gecis_efekti._sahneye_git("res://game/Game.tscn")
	pass # Replace with function body.


func _on_hakkinda_pressed():

	$gecis_efekti._sahneye_git("res://menu/hakkinda.tscn")
	pass # Replace with function body.


func _on_ayarlar_pressed():
	$gecis_efekti._sahneye_git("res://menu/ayarlar.tscn")
	pass # Replace with function body.
