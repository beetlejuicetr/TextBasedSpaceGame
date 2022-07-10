extends Control


func _ready():
	self.visible = true
	$AnimationPlayer.play_backwards("gecis_efekti")
	pass

func _sahneye_git(sahne):
	$AnimationPlayer.play("gecis_efekti")
	get_tree().change_scene(sahne)
	pass

