extends Panel


onready var solarIcon = preload("res://game/assets/star.png")



func _ready():
	$bilgiler/sistem_adi.text = ""
	$bilgiler/sistem_bilgi.text = ""
	
	if GlobalData.sistemler == []:
		
		_solar_creator()
		pass
	pass
var alfabe = "ABCDEFGHIJKLMNOPRSTUVYZ"
var katagori = ["korsan","ticaret","asteroid","anomali"]
#[tr("ticaret1"),tr("ticaret2"),tr("ticaret3"),tr("korsan1"),tr("korsan2"),tr("korsan3"),tr("asteroid1"),tr("asteroid2"),tr("anomali1"),tr("anomali2")]

var sistem_bilgileri = {
	"1":{"aciklama":tr("ticaret1"),"type":"ticaret"},
	"2":{"aciklama":tr("ticaret2"),"type":"ticaret"},
	"3":{"aciklama":tr("ticaret3"),"type":"ticaret"},
	"4":{"aciklama":tr("korsan1"),"type":"korsan"},
	"5":{"aciklama":tr("korsan2"),"type":"korsan"},
	"6":{"aciklama":tr("korsan3"),"type":"korsan"},
	"7":{"aciklama":tr("asteroid1"),"type":"asteroid"},
	"8":{"aciklama":tr("asteroid1"),"type":"asteroid"},
	"9":{"aciklama":tr("anomali1"),"type":"anomali"},
	"10":{"aciklama":tr("anomali2"),"type":"anomali"}
}
var rng = RandomNumberGenerator.new()
func _solar_creator():
	
	
	
	
	var x = 0
	var y =0 

	for i in 15:
		rng.randomize()
		var type = katagori[rng.randi_range(0,len(katagori)-1)]
		
		var solarIns = TextureButton.new()
		solarIns.texture_normal = solarIcon
		#solarIns.expand = true
		solarIns.rect_scale = Vector2(0.1,0.1)
		var solarInsName = ""
		for i2 in 4:
			solarInsName += alfabe[rng.randi_range(0,len(alfabe)-1)]
			
		var solarInsInfo = rng.randi_range(0,len(sistem_bilgileri)-1)
		solarIns.name = solarInsName +"-"+str(rng.randi_range(0,999))
		
		
		solarIns.set_script(load("res://game/systems_info.gd"))
		var current_systems_info = []
		
		for i3 in sistem_bilgileri:
			if sistem_bilgileri[i3]["type"] == type:
				current_systems_info.append(sistem_bilgileri[i3]["aciklama"])
				pass 
		solarIns.info = current_systems_info[rng.randi_range(0,len(current_systems_info)-1)]
		solarIns.rect_position.x = rng.randi_range(x-150,x+200)
		solarIns.type = type
		solarIns.rect_position.y = rng.randi_range(y-50,y+200)
		solarIns.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		add_child(solarIns)
		print(len(current_systems_info))
		pass
	
	
	pass



func _sistem_degisimi(ad,bilgi):
	$bilgiler/sistem_adi.text = ad
	$bilgiler/sistem_bilgi.bbcode_text = bilgi
	pass


func _on_sisteme_git_btn_pressed():
	var gidecekYakit = rng.randi_range(10,20)
	var gidecekYemek = rng.randi_range(5,10)
	if GlobalData.gemi_bilgileri["yakit"] >= gidecekYakit and GlobalData.gemi_bilgileri["murettebat_morali"] >= 10:
		GlobalData.gemi_bilgileri["yakit"] -= gidecekYakit
		
		if GlobalData.gemi_bilgileri["yemek"] >= 10:
			GlobalData.gemi_bilgileri["yemek"] -= gidecekYemek
		else:
			GlobalData.gemi_bilgileri["yemek"] = 0
			GlobalData.gemi_bilgileri["murettebat_morali"] -= gidecekYemek
		
		print(GlobalData.secili_sistem ,"e gidildi")
		get_node(GlobalData.secili_sistem).gidildi = true
		
		if get_node(GlobalData.secili_sistem).type == "korsan":
			EventTrigger._korsan_saldirisi()
		elif get_node(GlobalData.secili_sistem).type == "ticaret":
			EventTrigger._tuccar_gemisi()
		elif get_node(GlobalData.secili_sistem).type == "asteroid":
			EventTrigger._astroid_kusagi()
		elif get_node(GlobalData.secili_sistem).type == "anomali":
			EventTrigger._uzay_anomalisi()
		pass
	pass # Replace with function body.
