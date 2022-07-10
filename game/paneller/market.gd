extends Panel

var rngHandler = RandomNumberGenerator.new()
var fiyatListesi = {
	"yakitFiyat":0,
	"yemekFiyat":0,
	"gemiFiyat":0,
	"motorFiyat":0,
}
func _ready():
	
	for i in fiyatListesi:
		rngHandler.randomize()
		fiyatListesi[i] = rngHandler.randi_range(5,10)
		
	
	print(fiyatListesi)
	
	
	$Butonlar/yakitBtn.text = str("-",fiyatListesi["yakitFiyat"],tr("yemek")," +", fiyatListesi["yemekFiyat"],tr("yakit"))
	$Butonlar/yemekBtn.text = str("-",fiyatListesi["yemekFiyat"],tr("yakit")," +", fiyatListesi["yakitFiyat"],tr("yemek"))
	$Butonlar/gemiBtn.text = str("-",fiyatListesi["gemiFiyat"],tr("yakit")," +", 1,tr("gemi"))
	$Butonlar/motorBtn.text = str("-",fiyatListesi["motorFiyat"],tr("yakit")," +", 1,tr("motor"))


func _on_yakitBtn_pressed():
	if GlobalData.gemi_bilgileri["yemek"] > fiyatListesi["yakitFiyat"]:
		GlobalData.gemi_bilgileri["yemek"] -= fiyatListesi["yemekFiyat"]
		GlobalData.gemi_bilgileri["yakit"] += fiyatListesi["yakitFiyat"]
	pass # Replace with function body.


func _on_yemekBtn_pressed():
	if GlobalData.gemi_bilgileri["yakit"] > fiyatListesi["yemekFiyat"]:
		GlobalData.gemi_bilgileri["yakit"] -= fiyatListesi["yakitFiyat"]
		GlobalData.gemi_bilgileri["yemek"] += fiyatListesi["yemekFiyat"]
	pass # Replace with function body.


func _on_gemiBtn_pressed():
	if GlobalData.gemi_bilgileri["yakit"] > fiyatListesi["gemiFiyat"]:
		GlobalData.gemi_bilgileri["yakit"] -= fiyatListesi["gemiFiyat"]
		GlobalData.gemi_bilgileri["govde_parcasi"] += 1
		
	pass # Replace with function body.


func _on_motorBtn_pressed():
	if GlobalData.gemi_bilgileri["yakit"] > fiyatListesi["motorFiyat"]:
		GlobalData.gemi_bilgileri["yakit"] -= fiyatListesi["motorFiyat"]
		GlobalData.gemi_bilgileri["motor_parcasi"] += 1
	pass # Replace with function body.
