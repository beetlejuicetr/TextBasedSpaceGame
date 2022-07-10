extends Node

var rng = RandomNumberGenerator.new()


onready var eventEndPanel 
onready var eventVisualtyPanel

# ------------ #
func _visualty(pack):
	print(eventVisualtyPanel.get_node("cevaplar").get_children())
	for butonlar in eventVisualtyPanel.get_node("cevaplar").get_children():
		print(butonlar)
		butonlar.queue_free()
		
	
	yield(get_tree().create_timer(0.1),"timeout")
	eventVisualtyPanel.visible = true
	var visualtyOlayAdi = eventVisualtyPanel.get_node("olayAdi")
	visualtyOlayAdi.text = pack["olayAdi"]
	
	var visualtyOlayhakkinda = eventVisualtyPanel.get_node("olayHakkinda")
	visualtyOlayhakkinda.text = pack["olayHakkinda"] + "\n\n" + pack["olayDialog"] + "\n\n" + tr("neyapcan")
	
	
	var btn = preload("res://game/paneller/btn.tscn").instance()
	var btn_r = btn.duplicate()
	btn_r.name ="btn"
	add_child(btn_r)
	for i in pack["olaySecenekler"]:
		
		var a = btn.duplicate()
		a.name = str(i)
		a.text = pack["olaySecenekler"][i]
		a.set_script(load("res://game/button_handler.gd"))
		a.olay = pack["olayAdi"]
		eventVisualtyPanel.get_node("cevaplar").add_child(a)
	
	
	#--------------------------------#
	get_tree().set_pause(true)
	
	pass




func _prepare():
	eventEndPanel = preload("res://game/paneller/EventEnd.tscn").instance()
	eventVisualtyPanel = preload("res://game/paneller/EventTriggerVisuality.tscn").instance()
	get_parent().get_node("Control/").add_child(eventVisualtyPanel)
	get_parent().get_node("Control/").add_child(eventEndPanel)
	eventVisualtyPanel.visible = false
	eventEndPanel.visible = false

var prit
func _korsan_saldirisi():
	
	_visualty({
		"olayAdi":tr("bsprit"),
		"olayHakkinda":tr("prit1"),
		"olayDialog":tr("prit1_1"),
		"olaySecenekler":{"secenek1":tr("prisec1"),"secenek2":tr("prisec2"),"secenek3":tr("prisec3")},
		"komutlar":{"damage":1,"yakit":25,"yemek":20,"murettebat_moral":10}
	})
	pass


func _tuccar_gemisi():
	_visualty({
		"olayAdi":tr("bstic"),
		"olayHakkinda":tr("tic1"),
		"olayDialog":tr("tic1_1"),
		"olaySecenekler":{"secenek1":tr("ticsec1"),"secenek2":tr("ticsec2")},
		"komutlar":{"market":true}
	})
	pass

func _terk_edilmis_gemi():
	pass

func _solucan_deligi():
	pass


func _astroid_kusagi():
	pass

func _yardim_cagrisi():
	pass

func _motor_hasari():
	pass

func _uzay_anomalisi():
	pass

func _hastalik():
	pass

func _mental_cokus():
	pass

######

#func _sisteme_gidildi():
#	var olay = rng.randi_range(0,8)
#	if olay == 0:
#		_mental_cokus()
#		pass
#	elif olay == 1:
#		_korsan_saldirisi()
#		pass
#	elif olay == 2:
#		_tuccar_gemisi()
#		pass
#	elif olay == 3:
#		_solucan_deligi()
#		pass
#	elif olay == 4:
#		_terk_edilmis_gemi()
#		pass
#	elif olay == 5:
#		_astroid_kusagi()
#		pass
#	elif olay == 6:
#		_hastalik()
#		pass
#	elif olay == 7:
#		_motor_hasari()
#		pass
#	elif olay == 8:
#		_uzay_anomalisi()
#		pass
#	pass




# ------------------------ #

func _kacis_basarili():
	eventVisualtyPanel.visible = false
	eventEndPanel.visible = true
	eventEndPanel.get_node("olayHakkinda").text = tr("korsankacsonuc")
	pass
func _saldiri_basarili():
	eventVisualtyPanel.visible = false
	eventEndPanel.visible = true
	eventEndPanel.get_node("olayHakkinda").text = tr("korsansaldirsonuc")
	pass
func _hizlanma_basarili():
	eventVisualtyPanel.visible = false
	eventEndPanel.visible = true
	pass
func _kesif_basarili():
	eventVisualtyPanel.visible = false
	eventEndPanel.visible = true
	eventEndPanel.get_node("olayHakkinda").text = tr("yardimcagriolumlu")
	pass
