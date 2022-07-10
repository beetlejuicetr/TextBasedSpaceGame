extends Panel

onready var durum = get_node("durum")

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/murettebat_morali.text = tr("moral")
	$VBoxContainer/yemek_durum.text = tr("yemek")
	$VBoxContainer/yakit_durum.text = tr("yakit")
	$VBoxContainer/Govde_parcasi.text = tr("gemi")
	$VBoxContainer/motor_parcasi.text = tr("motor")
	pass # Replace with function body.



func _on_murettebat_morali_pressed():
	durum.text = "%"+str(GlobalData.gemi_bilgileri["murettebat_morali"])
	pass # Replace with function body.


func _on_yemek_durum_pressed():
	durum.text = "%"+str(GlobalData.gemi_bilgileri["yemek"])
	pass # Replace with function body.


func _on_yakit_durum_pressed():
	durum.text = "%"+str(GlobalData.gemi_bilgileri["yakit"])
	pass # Replace with function body.


func _on_Govde_parcasi_pressed():
	durum.text = str(GlobalData.gemi_bilgileri["govde_parcasi"])
	pass # Replace with function body.


func _on_motor_parcasi_pressed():
	durum.text = str(GlobalData.gemi_bilgileri["motor_parcasi"])
	pass # Replace with function body.
