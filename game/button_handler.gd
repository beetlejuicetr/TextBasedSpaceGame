extends Button

var rngHandler = RandomNumberGenerator.new()
var olay

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed",self,"_secilen_secenek")
	
	pass # Replace with function body.


func _secilen_secenek(): # aksiyon / action
	if name == "secenek1":
		print("Aksiyon")
		if olay == tr("bsprit"):
			var rng = rngHandler.randi_range(0,10) # yuzde 70 lik bir kazanma orani
			if rng > 6 :
				# kacis basarili
				print("Saldiri basarili")
				EventTrigger._saldiri_basarili()
				
			else:
				print("kaybettin!")
				get_tree().change_scene("res://game/Deathscreen.tscn")
				
				# oyunu kaybettin!
			pass
		if olay == tr("bstic"):
			print("Market Acildi")
			pass
		pass
	
	if name == "secenek2": # cikis / escape
		print("Cikis")
		if olay == tr("bsprit"):
			var rng = rngHandler.randi_range(0,2)
			if rng == 0:
				print("Kacis Basarili!")
				EventTrigger._kacis_basarili()
				pass
			else:
				print("Kaybettin!")
				pass
			pass
		
		
		if olay == tr("bstic"):
			pass
		
		pass
	
	if name == "secenek3": # ektra aksiyon / extra action
		print("Ekstra aksiyon")
		if olay == tr("bsprit"):
			
			pass
		
		pass
	
	
	if name == "exit":
		get_parent().visible = false
		get_tree().set_pause(false)
		
		pass
	pass
	
