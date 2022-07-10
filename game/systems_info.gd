extends TextureButton


func _ready():
	self.connect("pressed",self,"_bilgileri_getir")
	
	pass

var info = "Error !"
var gidildi = false
var type
func _bilgileri_getir():
	get_parent().get_node("sisteme_git_btn").visible = true
	if info == "":
		 info = "[color=red]Error![/color]"
	self.self_modulate = Color.green
	GlobalData.secili_sistem = name
	#print(name)
	
	get_parent()._sistem_degisimi(name,info)
	pass

func _physics_process(delta):
	if name != GlobalData.secili_sistem:
		if gidildi == true:
			self.self_modulate = Color.red
		else:
			self.self_modulate = Color.white
	pass
